<?php
// index.php (Tampilan Utama dan Form Konsultasi)
include 'diagnosis.php'; 

$cf_terms = [];
if (isset($cf_terms_query) && $cf_terms_query) {
    while ($row = $cf_terms_query->fetch_assoc()) {
        $cf_terms[] = $row['term'];
    }
}
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistem Pakar Gangguan Jiwa - CERTAINTY FACTOR</title>
    <link rel="stylesheet" href="css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
</head>
<body>
    
    <div class="hero-section">
        <video autoplay muted loop id="video-background">
            <source src="media/bg.mp4" type="video/mp4">
            Browser Anda tidak mendukung tag video.
        </video>
        
        <div class="video-overlay"></div>
        
        <div class="hero-content">
            <h1>Sistem Pakar Analisis Gangguan Jiwa</h1>
            <p>Aplikasi berbasis Certainty Factor (CF) untuk diagnosis awal kesehatan mental.</p>
        </div>
    </div>

    <main>
        
        <div class="card profile-card" style="animation-delay: 0.1s;">
            <img src="media/gua.jpg" alt="Foto Profil Pengembang">
            <div class="profile-info">
                <h3>Halo! Saya Rahmat Eka Satria</h3>
                <p>Website ini saya kembangkan sebagai proyek tugas kecerdasan buatan kasus metode Certainty Factor (CF) berdasarkan data pakar. Mohon gunakan dengan bijak dan selalu konsultasikan hasil dengan profesional.</p>
            </div>
        </div>
        
        <?php if ($hasil_diagnosis): ?>
        <div class="card result-card" style="animation-delay: 0.3s;">
            <h2>Hasil Diagnosis Anda</h2>
            <hr>
            <h3>Tingkat Kepastian: <?php echo $hasil_diagnosis['persentase']; ?>%</h3>
            <div class="diagnosis-box">
                <p>Kemungkinan Anda mengalami:</p>
                <strong><?php echo $hasil_diagnosis['penyakit']; ?></strong>
            </div>

            <p class="note">Catatan: Hasil ini hanyalah analisis awal sistem pakar. Selalu konsultasikan dengan Dokter Spesialis Kedokteran Jiwa untuk diagnosis dan penanganan yang akurat.</p>
        </div>
        <?php endif; ?>

        <div class="card form-card" style="animation-delay: 0.5s;">
            <h2>Konsultasi Gejala</h2>
            <p>Pilih tingkat keyakinan (Certainty Factor) Anda terhadap setiap gejala yang dirasakan.</p>
            <form method="POST" action="index.php" id="konsultasi-form">
                <?php $i = 1; 
                if (isset($gejala_query) && $gejala_query) {
                    while ($gejala = $gejala_query->fetch_assoc()): ?>
                    <div class="gejala-item">
                        <label for="<?php echo $gejala['kode_gejala']; ?>">
                            <?php echo $i++; ?>. <?php echo $gejala['nama_gejala']; ?>
                        </label>
                        <select name="<?php echo $gejala['kode_gejala']; ?>" id="<?php echo $gejala['kode_gejala']; ?>" required>
                            <option value="">-- Pilih Tingkat Keyakinan --</option>
                            <?php foreach ($cf_terms as $term): ?>
                            <option value="<?php echo $term; ?>"><?php echo $term; ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                <?php endwhile; 
                } else {
                    echo "<p>Error: Data gejala tidak dapat dimuat.</p>";
                }
                ?>

                <button type="submit" class="submit-btn">Analisis Diagnosis</button>
            </form>
        </div>
    </main>
    
    <footer>
        <div class="footer">
            <p>&copy; 2025 Sistem Pakar CF | <a class="gua" href="https://github.com/rhmatzeka">Rahmat Eka Satria</a>.</p>
        </div>
    </footer>

    <button id="theme-toggle">🌙</button>

    <script src="js/script.js"></script>
</body>
</html>