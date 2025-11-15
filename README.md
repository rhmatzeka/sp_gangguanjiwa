

````markdown
# 🧠 Sistem Pakar Analisis Gangguan Jiwa (Certainty Factor)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Technology](https://img.shields.io/badge/Tech-PHP%20%7C%20MySQL%20%7C%20CSS%20Variables-blue.svg)](https://www.php.net/)

Sistem Pakar ini dirancang untuk melakukan diagnosis awal terhadap empat jenis gangguan kejiwaan umum, yaitu Gangguan Depresi, Gangguan Kecemasan Menyeluruh, Skizofrenia, dan Gangguan Bipolar. Aplikasi ini menggunakan **Metode Certainty Factor (CF)** untuk mengukur tingkat kepastian diagnosis berdasarkan gejala yang diinputkan pengguna dan bobot keyakinan dari pakar.

Aplikasi ini dilengkapi dengan fitur **Dual Mode (Light & Dark Mode)** yang dinamis dan tampilan yang modern.

---

## Fitur Utama

* **Metode Certainty Factor (CF):** Perhitungan berbasis bobot pakar dan keyakinan pengguna untuk hasil diagnosis yang terukur (persentase).
* **Dual Mode:** Mendukung Mode Terang (Light Mode) dan Mode Gelap (Dark Mode) yang dapat diaktifkan melalui tombol toggle, dengan preferensi disimpan di *browser* (localStorage).
* **Tampilan Dinamis:** Menggunakan CSS Variables, Flexbox, dan animasi *fade-in* untuk user interface (UI) yang responsif dan elegan.
* **Video Background:** Tampilan Hero Section yang menarik dengan video *background* yang berjalan.
* **Database Terstruktur:** Mengelola data Penyakit, Gejala, dan Aturan (Rules) menggunakan MySQL.

---

## Persyaratan Sistem

Untuk menjalankan aplikasi ini secara lokal, Anda membutuhkan lingkungan server web yang mendukung PHP dan MySQL, seperti:

* **Server:** XAMPP, Laragon, MAMP, atau WAMP.
* **Bahasa Pemrograman:** PHP (versi 7.0 atau lebih tinggi disarankan).
* **Database:** MySQL/MariaDB.
* **Browser:** Chrome, Firefox, Edge, atau Safari modern.

---

## 🚀 Panduan Instalasi dan Konfigurasi

Ikuti langkah-langkah berikut untuk menginstal dan menjalankan proyek di lingkungan lokal Anda.

### 1. Kloning Repositori

```bash
git clone [https://github.com/yourusername/sistem-pakar-jiwa.git](https://github.com/yourusername/sistem-pakar-jiwa.git)
cd sistem-pakar-jiwa
````

*(Ganti `yourusername` dengan username GitHub Anda.)*

### 2\. Penyiapan Database

a. Buka *Control Panel* XAMPP/Laragon dan jalankan **Apache** dan **MySQL**.
b. Akses **phpMyAdmin** (biasanya di `http://localhost/phpmyadmin/`).
c. Buat database baru dengan nama: `sp_gangguan_jiwa`.
d. **Import Data:** Jalankan seluruh skrip SQL yang berisi tabel (`gejala`, `penyakit`, `rules`, `detail_rule`, `nilai_kepastian`) dan data awalnya. *Anda bisa mendapatkan skrip SQL lengkap dari instruksi penyiapan awal proyek.*

### 3\. Konfigurasi Koneksi PHP

Buka file `config/config.php` dan sesuaikan kredensial koneksi database Anda jika berbeda dari default:

**`config/config.php`**

```php
<?php
$host = "localhost";
$user = "root"; 
$pass = ""; // Ganti jika Anda menggunakan password
$db_name = "sp_gangguan_jiwa"; 
// ... (sisa kode)
?>
```

### 4\. Penambahan File Media

Aplikasi ini membutuhkan file media untuk tampilan yang optimal. Tambahkan file-file berikut ke folder `media/`:

  * `media/foto_profil.jpg`: Foto diri Anda (format persegi disarankan).
  * `media/video_bg.mp4`: Video pendek (looping) untuk *hero section*.

### 5\. Akses Aplikasi

Akses aplikasi melalui browser Anda:

```
http://localhost/nama_folder_proyek_anda/
```

-----

## Struktur Proyek

Struktur folder proyek ini dirancang untuk pemisahan tugas (Separation of Concerns) yang jelas:

```
sistem_pakar_jiwa/
├── config/
│   └── config.php        # Koneksi Database
├── css/
│   └── style.css         # Styling (Termasuk Dual Mode CSS Variables)
├── js/
│   └── script.js         # Logika Dark Mode Toggle & Validasi
├── media/                # File Foto dan Video Background
├── diagnosis.php         # Logika Inti Certainty Factor (CF)
└── index.php             # Tampilan Utama (HTML/PHP)
```

-----

## 📝 Kontribusi dan Lisensi

Proyek ini bersifat *open-source* dan didistribusikan di bawah **Lisensi MIT**.

Jika Anda menemukan *bug* atau memiliki saran perbaikan, jangan ragu untuk membuat **Issue** atau mengirimkan **Pull Request**.

-----

*Dibuat oleh: *Rahmat Eka Satria*
*Institusi: Universitas Pamulang*
*Berdasarkan penelitian: https://jsisfotek.org/index.php/JSisfotek/article/view/70/70*

