<?php
// diagnosis.php (Logika CF dan Pemrosesan Input)

// 1. FIX UNDEFINED VARIABLE: Inisialisasi variabel di luar blok POST
$hasil_diagnosis = null;
$raw_results = [];
$combined_cf = [];

// 2. FIX FILE PATH: Perbaiki jalur include
include 'config/config.php';

// Fungsi untuk menghitung Certainty Factor Rule
function getCertaintyFactor($conn, $rule_id, $cf_gejala_user) {
    // 1. Ambil nilai FK Pakar untuk Rule ini
    $stmt = $conn->prepare("SELECT fk_pakar FROM rules WHERE id_rule = ?");
    $stmt->bind_param("s", $rule_id);
    $stmt->execute();
    $result = $stmt->get_result();
    $rule = $result->fetch_assoc();
    $cf_pakar = $rule['fk_pakar'];

    // 2. Ambil semua gejala dalam rule
    $stmt = $conn->prepare("SELECT kode_gejala FROM detail_rule WHERE id_rule = ?");
    $stmt->bind_param("s", $rule_id);
    $stmt->execute();
    $result_detail = $stmt->get_result();

    $min_cf_user = 2.0; 
    $total_gejala_rule = $result_detail->num_rows;
    $match_count = 0;

    // 3. Tentukan CF Gejala Minimum (CF User)
    while ($detail = $result_detail->fetch_assoc()) {
        $kode_gejala = $detail['kode_gejala'];
        $cf_user_val = $cf_gejala_user[$kode_gejala] ?? 0.0; 

        if ($cf_user_val > 0.0) {
            $min_cf_user = min($min_cf_user, $cf_user_val);
            $match_count++;
        }
    }
    
    // Rule hanya dieksekusi jika semua gejala yang disyaratkan oleh rule dijawab (CF user > 0)
    // Penyesuaian: Kita hanya menghitung rule yang gejalanya cocok dengan jawaban user (Min CF > 0.0)
    if ($min_cf_user < 2.0 && $total_gejala_rule == $match_count) {
        // CF Rule = Min(CF user gejala) * CF pakar rule
        $cf_rule = $min_cf_user * $cf_pakar;
        return $cf_rule;
    }

    return null;
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $cf_gejala_user = [];
    
    // 1. Proses Input dari Form (Gejala dan Nilai CF User)
    foreach ($_POST as $key => $value) {
        if (strpos($key, 'G') === 0 && !empty($value)) {
            $kode_gejala = $key;
            // Ambil nilai FK dari term (misal: 'Pasti' -> 1.0)
            $stmt = $conn->prepare("SELECT fk_user FROM nilai_kepastian WHERE term = ?");
            $stmt->bind_param("s", $value);
            $stmt->execute();
            $result = $stmt->get_result();
            if ($row = $result->fetch_assoc()) {
                $cf_gejala_user[$kode_gejala] = $row['fk_user'];
            }
        }
    }

    // 2. Iterasi Semua Rule dan Hitung CF Rule (CF[H, E])
    $rules_query = $conn->query("SELECT id_rule, kode_penyakit FROM rules");
    while ($rule = $rules_query->fetch_assoc()) {
        $cf_rule = getCertaintyFactor($conn, $rule['id_rule'], $cf_gejala_user);

        if ($cf_rule !== null) {
            $penyakit = $rule['kode_penyakit'];

            // 3. Hitung CF Gabungan (CF Combine)
            if (!isset($combined_cf[$penyakit])) {
                $combined_cf[$penyakit] = $cf_rule; // CF pertama
            } else {
                // CF Gabungan: CF_lama + CF_baru * (1 - CF_lama)
                $cf_lama = $combined_cf[$penyakit];
                $combined_cf[$penyakit] = $cf_lama + $cf_rule * (1 - $cf_lama);
            }

            $raw_results[] = [
                'rule' => $rule['id_rule'],
                'penyakit' => $penyakit,
                'cf_rule' => round($cf_rule, 4)
            ];
        }
    }

    // 4. Tentukan Hasil Diagnosis
    $max_cf = 0;
    $penyakit_tertinggi = null;

    foreach ($combined_cf as $kode_p => $cf) {
        if ($cf > $max_cf) {
            $max_cf = $cf;
            $penyakit_tertinggi = $kode_p;
        }
    }

    if ($penyakit_tertinggi) {
        $stmt = $conn->prepare("SELECT nama_penyakit FROM penyakit WHERE kode_penyakit = ?");
        $stmt->bind_param("s", $penyakit_tertinggi);
        $stmt->execute();
        $result = $stmt->get_result();
        $penyakit_info = $result->fetch_assoc();

        $hasil_diagnosis = [ // Variabel ini sekarang terdefinisi karena sudah diinisialisasi di atas
            'penyakit' => $penyakit_info['nama_penyakit'],
            'persentase' => round($max_cf * 100, 2)
        ];
    }
}

// Untuk menampilkan hasil pada tampilan frontend
$gejala_query = $conn->query("SELECT kode_gejala, nama_gejala FROM gejala");
$cf_terms_query = $conn->query("SELECT term FROM nilai_kepastian ORDER BY fk_user ASC");
?>