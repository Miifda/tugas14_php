-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 29 Jan 2026 pada 08.23
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_beasiswa`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `aplikasi_beasiswa`
--

CREATE TABLE `aplikasi_beasiswa` (
  `id` int(11) NOT NULL,
  `beasiswa_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` enum('pending','diterima','ditolak') DEFAULT 'pending',
  `berkas` varchar(255) DEFAULT NULL,
  `catatan` text DEFAULT NULL,
  `alasan` text DEFAULT NULL,
  `tanggal_pengajuan` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `aplikasi_beasiswa`
--

INSERT INTO `aplikasi_beasiswa` (`id`, `beasiswa_id`, `user_id`, `status`, `berkas`, `catatan`, `alasan`, `tanggal_pengajuan`) VALUES
(1, 1, 1, 'pending', 'berkas_1_1234567890.pdf', 'Saya sangat membutuhkan beasiswa ini untuk melanjutkan pendidikan saya.', NULL, '2026-01-29 05:57:46'),
(2, 2, 2, 'diterima', 'berkas_2_1234567891.pdf', 'Terima kasih atas kesempatan ini.', NULL, '2026-01-29 05:57:46'),
(3, 1, 2, 'ditolak', 'berkas_1_1234567892.pdf', 'IPK belum memenuhi syarat.', NULL, '2026-01-29 05:57:46'),
(4, 9, 2, 'pending', 'berkas_2_1769668324.jpeg', 'akuuuu', NULL, '2026-01-29 06:32:04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `beasiswa`
--

CREATE TABLE `beasiswa` (
  `id` int(11) NOT NULL,
  `nama_beasiswa` varchar(200) NOT NULL,
  `penyelenggara` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL,
  `nominal` decimal(12,2) NOT NULL,
  `deadline` date NOT NULL,
  `kriteria` text NOT NULL,
  `status` enum('aktif','nonaktif') DEFAULT 'aktif',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `beasiswa`
--

INSERT INTO `beasiswa` (`id`, `nama_beasiswa`, `penyelenggara`, `deskripsi`, `nominal`, `deadline`, `kriteria`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Beasiswa PPA (Peningkatan Prestasi Akademik)', 'Kementerian Pendidikan dan Kebudayaan', 'Beasiswa ini diperuntukkan bagi mahasiswa berprestasi dengan IPK minimal 3.00. Beasiswa PPA bertujuan untuk membantu mahasiswa yang memiliki kemampuan akademik tinggi namun memiliki keterbatasan ekonomi.', 1500000.00, '2026-06-30', '- IPK minimal 3.00\n- Aktif mengikuti organisasi kemahasiswaan\n- Memiliki prestasi akademik/non-akademik\n- Surat keterangan tidak mampu dari orang tua', 'aktif', '2026-01-29 05:54:15', '2026-01-29 05:54:15'),
(2, 'Beasiswa BBM (Bantuan Belajar Mahasiswa)', 'Kementerian Pendidikan dan Kebudayaan', 'Beasiswa BBM diberikan kepada mahasiswa yang memiliki keterbatasan ekonomi namun tetap mempertahankan prestasi akademik yang baik. Beasiswa ini bertujuan untuk membantu biaya pendidikan mahasiswa kurang mampu.', 1200000.00, '2026-07-15', '- IPK minimal 2.75\n- Surat keterangan tidak mampu dari orang tua\n- Aktif dalam kegiatan kampus\n- Tidak sedang menerima beasiswa lain', 'aktif', '2026-01-29 05:54:15', '2026-01-29 05:54:15'),
(3, 'Beasiswa Unggulan', 'Kementerian Pendidikan dan Kebudayaan', 'Beasiswa Unggulan merupakan program beasiswa bergengsi dari pemerintah Indonesia untuk mendukung mahasiswa berbakat melanjutkan pendidikan ke jenjang yang lebih tinggi, baik di dalam maupun luar negeri.', 10000000.00, '2026-05-31', '- IPK minimal 3.25\n- Memiliki prestasi tingkat nasional/internasional\n- Proposal penelitian yang inovatif\n- Rekomendasi dari dosen pembimbing\n- Kemampuan bahasa Inggris yang baik', 'aktif', '2026-01-29 05:54:15', '2026-01-29 05:54:15'),
(4, 'Beasiswa LPDP (Lembaga Pengelola Dana Pendidikan)', 'Kementerian Keuangan RI', 'Beasiswa LPDP adalah beasiswa bergengsi dari pemerintah Indonesia untuk jenjang S2 dan S3, baik di dalam maupun luar negeri. Beasiswa ini mencakup biaya pendidikan penuh, biaya hidup, dan tunjangan lainnya.', 50000000.00, '2026-04-30', '- IPK minimal 3.00 untuk S1, 3.25 untuk S2\n- Lulus seleksi administrasi, wawancara, dan psikotes\n- Sehat jasmani dan rohani\n- Tidak terikat dengan instansi lain\n- Bersedia mengabdi di Indonesia setelah lulus', 'aktif', '2026-01-29 05:54:15', '2026-01-29 05:54:15'),
(5, 'Beasiswa Bidikmisi', 'Kementerian Pendidikan dan Kebudayaan', 'Beasiswa Bidikmisi adalah bantuan biaya pendidikan bagi calon mahasiswa dan mahasiswa yang memiliki potensi akademik memadai dan kurang mampu secara ekonomi di perguruan tinggi.', 12000000.00, '2026-08-15', '- Lulus seleksi masuk PTN/PTS\n- Memiliki KIP/Kartu Keluarga Sejahtera\n- Penghasilan orang tua maksimal Rp 2 juta/bulan\n- IPK minimal 2.50\n- Tidak menerima beasiswa lain', 'aktif', '2026-01-29 05:54:15', '2026-01-29 05:54:15'),
(6, 'Beasiswa Supersemar', 'Yayasan Supersemar', 'Beasiswa Supersemar diberikan kepada mahasiswa berprestasi di berbagai perguruan tinggi di Indonesia. Beasiswa ini bertujuan untuk membantu mahasiswa yang memiliki prestasi akademik dan non-akademik yang baik.', 3000000.00, '2026-09-30', '- IPK minimal 2.75\n- Aktif dalam organisasi kemahasiswaan\n- Memiliki prestasi minimal tingkat kampus\n- Surat rekomendasi dari fakultas', 'aktif', '2026-01-29 05:54:15', '2026-01-29 05:54:15'),
(7, 'Beasiswa Tanoto Foundation', 'Tanoto Foundation', 'Beasiswa Tanoto Foundation memberikan dukungan pendidikan bagi mahasiswa berprestasi dari keluarga kurang mampu. Program ini juga mencakup pengembangan kepemimpinan dan karakter.', 8000000.00, '2026-06-15', '- IPK minimal 3.00\n- Penghasilan orang tua maksimal Rp 4 juta/bulan\n- Aktif dalam kegiatan sosial kemasyarakatan\n- Memiliki jiwa kepemimpinan\n- Bersedia mengikuti program pengembangan diri', 'aktif', '2026-01-29 05:54:15', '2026-01-29 05:54:15'),
(8, 'Beasiswa Djarum Foundation', 'Djarum Foundation', 'Beasiswa Djarum Plus diberikan kepada mahasiswa berprestasi yang memiliki kemampuan leadership dan aktif dalam kegiatan kemahasiswaan. Beasiswa ini juga memberikan pelatihan soft skills.', 6000000.00, '2026-07-31', '- IPK minimal 3.00\n- Aktif dalam organisasi kemahasiswaan\n- Memiliki kemampuan leadership yang baik\n- Tidak sedang menerima beasiswa lain\n- Minimal semester 3', 'aktif', '2026-01-29 05:54:15', '2026-01-29 05:54:15'),
(9, 'Beasiswa Astra Honda Racing School', 'PT Astra Honda Motor', 'Beasiswa ini khusus untuk mahasiswa yang memiliki minat dan bakat di bidang otomotif dan racing. Program ini memberikan kesempatan untuk mengembangkan skill di bidang otomotif.', 5000000.00, '2026-05-15', '- Mahasiswa Teknik Mesin/Otomotif\n- Memiliki minat di bidang racing/otomotif\n- IPK minimal 2.75\n- Sehat jasmani dan rohani\n- Memiliki SIM C', 'aktif', '2026-01-29 05:54:15', '2026-01-29 05:54:15'),
(10, 'Beasiswa Pertamina', 'PT Pertamina (Persero)', 'Beasiswa Pertamina diberikan kepada mahasiswa berprestasi di bidang teknik dan sains. Beasiswa ini juga memberikan kesempatan magang di perusahaan Pertamina.', 7500000.00, '2026-06-30', '- IPK minimal 3.00\n- Mahasiswa Teknik/Sains\n- Aktif dalam penelitian/kegiatan ilmiah\n- Memiliki kemampuan bahasa Inggris\n- Bersedia magang di Pertamina', 'aktif', '2026-01-29 05:54:15', '2026-01-29 05:54:15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','admin') DEFAULT 'user',
  `nim` varchar(20) DEFAULT NULL,
  `jurusan` varchar(100) DEFAULT NULL,
  `semester` int(11) DEFAULT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `status` enum('aktif','nonaktif') DEFAULT 'aktif',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `nim`, `jurusan`, `semester`, `no_hp`, `foto`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'admin@beasiswa.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, NULL, NULL, NULL, 'aktif', '2026-01-29 05:53:19', '2026-01-29 05:53:19'),
(2, 'Budi Santoso', 'budi@email.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', '2021001', 'Teknik Informatika', 5, '081234567890', NULL, 'aktif', '2026-01-29 05:53:49', '2026-01-29 05:53:49'),
(3, 'Siti Aminah', 'siti@email.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', '2021002', 'Sistem Informasi', 3, '081234567891', NULL, 'aktif', '2026-01-29 05:53:49', '2026-01-29 05:53:49');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `aplikasi_beasiswa`
--
ALTER TABLE `aplikasi_beasiswa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_aplikasi_user` (`user_id`),
  ADD KEY `idx_aplikasi_beasiswa` (`beasiswa_id`),
  ADD KEY `idx_aplikasi_status` (`status`);

--
-- Indeks untuk tabel `beasiswa`
--
ALTER TABLE `beasiswa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_beasiswa_status` (`status`),
  ADD KEY `idx_beasiswa_deadline` (`deadline`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_users_email` (`email`),
  ADD KEY `idx_users_role` (`role`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `aplikasi_beasiswa`
--
ALTER TABLE `aplikasi_beasiswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `beasiswa`
--
ALTER TABLE `beasiswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `aplikasi_beasiswa`
--
ALTER TABLE `aplikasi_beasiswa`
  ADD CONSTRAINT `aplikasi_beasiswa_ibfk_1` FOREIGN KEY (`beasiswa_id`) REFERENCES `beasiswa` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `aplikasi_beasiswa_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
