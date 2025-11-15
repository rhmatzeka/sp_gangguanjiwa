document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('konsultasi-form');
    const selectElements = form.querySelectorAll('select');
    const themeToggle = document.getElementById('theme-toggle');
    const body = document.body;

    // --- LOGIKA DARK MODE ---
    
    // 1. Fungsi untuk mengatur mode
    function setDarkMode(isDark) {
        if (isDark) {
            body.classList.add('dark-mode');
            themeToggle.textContent = '🔆'; // Icon Mode Terang
            localStorage.setItem('theme', 'dark');
        } else {
            body.classList.remove('dark-mode');
            themeToggle.textContent = '🌙'; // Icon Mode Gelap
            localStorage.setItem('theme', 'light');
        }
    }

    // 2. Memuat preferensi saat halaman dimuat
    const savedTheme = localStorage.getItem('theme');
    if (savedTheme === 'dark') {
        setDarkMode(true);
    } else if (savedTheme === 'light') {
        setDarkMode(false);
    } else if (window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches) {
        // Jika tidak ada preferensi, ikuti pengaturan sistem operasi
        setDarkMode(true);
    } else {
        setDarkMode(false); // Default ke mode terang
    }

    // 3. Listener Tombol Toggle
    themeToggle.addEventListener('click', () => {
        const isDark = body.classList.contains('dark-mode');
        setDarkMode(!isDark);
    });

    // --- LOGIKA FORM & VALIDASI ---
    
    // Interaktivitas pada Select
    selectElements.forEach(select => {
        select.addEventListener('change', function() {
            const parent = this.closest('.gejala-item');
            if (this.value !== "") {
                parent.classList.add('is-selected');
            } else {
                parent.classList.remove('is-selected');
            }
        });
        // Terapkan is-selected pada load jika ada nilai (misal setelah refresh post)
        if (select.value !== "") {
            select.closest('.gejala-item').classList.add('is-selected');
        }
    });

    // Validasi Sederhana sebelum submit
    form.addEventListener('submit', function(e) {
        let allAnswered = true;
        selectElements.forEach(select => {
            if (select.value === "") {
                allAnswered = false;
                select.style.border = '2px solid red';
            } else {
                select.style.border = '1px solid var(--color-border)';
            }
        });

        if (!allAnswered) {
            e.preventDefault();
            alert("Mohon jawab semua pertanyaan gejala sebelum melakukan analisis.");
        }
    });
});