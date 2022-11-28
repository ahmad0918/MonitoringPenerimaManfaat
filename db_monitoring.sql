-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 09 Jun 2021 pada 14.21
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_monitoring`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `laporan_prestasi`
--

CREATE TABLE `laporan_prestasi` (
  `id` int(11) NOT NULL,
  `kelas` varchar(45) NOT NULL,
  `nama_kegiatan` varchar(45) NOT NULL,
  `jenis_kegiatan2` enum('individual','kelompok') NOT NULL,
  `tingkat` enum('sekolah','kabupaten','provinsi','nasional','internasional') NOT NULL,
  `tahun` enum('2015','2016','2017','2018','2019','2020','2021') NOT NULL,
  `pencapaian` varchar(100) NOT NULL,
  `sertifikat` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `penerima_manfaat_id` int(11) NOT NULL,
  `status_prestasi` enum('Belum Dikonfirmasi','Diterima','Ditolak') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `laporan_prestasi`
--

INSERT INTO `laporan_prestasi` (`id`, `kelas`, `nama_kegiatan`, `jenis_kegiatan2`, `tingkat`, `tahun`, `pencapaian`, `sertifikat`, `created_at`, `updated_at`, `penerima_manfaat_id`, `status_prestasi`) VALUES
(15, 'kelas-11', 'Fotografi', 'individual', 'kabupaten', '2019', 'Juara 1', '1623149027190.png', '2021-06-08 15:28:30', '2021-06-08 15:28:30', 12, 'Belum Dikonfirmasi'),
(16, 'kelas-9', 'Puisi', 'individual', 'sekolah', '2018', 'Juara 2', '1623161263139.png', '2021-06-08 15:29:07', '2021-06-08 15:29:07', 18, 'Belum Dikonfirmasi'),
(17, 'kelas-12', 'Tilawah Qur\'an', 'kelompok', 'kabupaten', '2020', 'Juara 2', '1623166429945.jpeg', '2021-06-08 15:33:49', '2021-06-08 15:33:49', 12, 'Belum Dikonfirmasi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penerima_manfaat`
--

CREATE TABLE `penerima_manfaat` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(250) NOT NULL,
  `no_ajuan` varchar(100) NOT NULL,
  `kriteria_penerima` enum('Lembaga','Individu','Kelompok') NOT NULL,
  `alamat` text NOT NULL,
  `ket_program` text NOT NULL,
  `pic` varchar(50) NOT NULL,
  `metode` enum('Transfer','Tunai') NOT NULL,
  `no_rekening` varchar(50) NOT NULL,
  `nama_bank` varchar(50) NOT NULL,
  `pemilik_rekening` varchar(50) NOT NULL,
  `sumber_dana` varchar(50) NOT NULL,
  `total_dana` varchar(50) NOT NULL,
  `foto` varchar(200) NOT NULL DEFAULT 'undraw_profile.svg',
  `kategori_program` enum('Pendidikan','Kesehatan','Dakwah','Ekonomi','Sosial') NOT NULL,
  `status` enum('Aktif','Non-Aktif','') NOT NULL,
  `roles` enum('ADMIN','MITRA') NOT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `asnaf` enum('Fakir','Miskin','Amil','Mualaf','Riqab','Gharim','Fisabilillah','Ibnu Sabil') NOT NULL,
  `kategori_ajuan` enum('Darurat','Tidak Darurat') NOT NULL,
  `jenis_program` enum('Berkelanjutan','Tidak Berkelanjutan') NOT NULL,
  `bentuk_penyaluran` enum('Rutin','Tidak Rutin') NOT NULL,
  `sosmed` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `penerima_manfaat`
--

INSERT INTO `penerima_manfaat` (`id`, `nama`, `email`, `password`, `no_ajuan`, `kriteria_penerima`, `alamat`, `ket_program`, `pic`, `metode`, `no_rekening`, `nama_bank`, `pemilik_rekening`, `sumber_dana`, `total_dana`, `foto`, `kategori_program`, `status`, `roles`, `phone`, `asnaf`, `kategori_ajuan`, `jenis_program`, `bentuk_penyaluran`, `sosmed`, `created_at`, `updated_at`) VALUES
(12, 'Siti Nurholipah', 'sitiinurholipah1706@gmail.com', '$2y$10$Ihf9zq28jwxPe0Y3R3Hr3.jorwDpaoQynHTw39CIMZhQU65.R26ii', 'NO. 001/YBMPLN/UIPJBT/III/2021', 'Individu', 'Sukabumi', 'layak', 'Elan Sunarlan (Amil)', 'Tunai', '7108177138', 'BSI', 'Elan Sunarlan', 'Dana Progran Bukanan Maret 2021', '5000000', '1623233105919.jpg', 'Pendidikan', 'Aktif', 'ADMIN', '087722483128', 'Miskin', 'Tidak Darurat', 'Berkelanjutan', 'Rutin', 'IG : @sitinurholipah1713', '2021-06-09 10:07:55', '2021-06-09 10:07:55'),
(13, 'ahmad', 'ahm190711@gmail.com', '$2y$10$mgk9qgZjP3y88mJ/jmTiC.W4gQBsTFjAvsHIp7IBi9iQfselMyny2', 'NO. 002/YBMPLN/UIPJBT/III/2021', 'Lembaga', 'Bandung', 'layak', 'Elan Sunarlan (Amil)', 'Tunai', '7108177138', 'BSI', 'Elan Sunarlan', 'Dana Progran Bukanan Maret 2021', '1000000', 'undraw_profile.svg', 'Dakwah', 'Aktif', 'ADMIN', '0895321766450', 'Fisabilillah', 'Tidak Darurat', 'Tidak Berkelanjutan', 'Rutin', '@ahmad0918', '2021-06-08 14:29:31', '2021-06-08 14:29:31'),
(14, 'Fahriza', 'fahriza@gmail.com', '$2y$10$7bXrKAXvRs8f2Wn64ZafzuWP5dFaZGYhUsUirML08ZBIYAoAKUB9G', 'NO. 003/YBMPLN/UIPJBT/III/2021', 'Individu', 'Lembang', 'layak', 'Elan Sunarlan (Amil)', 'Transfer', '7108177138', 'BSI', 'Elan Sunarlan', 'Dana Progran Bukanan Maret 2021', '1500000', '1623233383104.jpeg', 'Ekonomi', 'Aktif', 'ADMIN', '085846524135', 'Fakir', 'Tidak Darurat', 'Berkelanjutan', 'Tidak Rutin', NULL, '2021-06-09 10:09:43', '2021-06-09 10:09:43'),
(15, 'Tatang', 'Tatang@gmail.com', '$2y$10$nwxhUWlmPDicAXiLCxfbq.5e3hKW7xKy4qfUehwvLZjNokyr9nyAK', 'NO. 004/YBMPLN/UIPJBT/III/2021', 'Kelompok', 'Jakarta', 'layak', 'Elan Sunarlan (Amil)', 'Tunai', '7108177138', 'BSI', 'Elan Sunarlan', 'Dana Progran Bulanan April 2021', '3000000', 'undraw_profile.svg', 'Sosial', 'Non-Aktif', 'ADMIN', NULL, 'Mualaf', 'Tidak Darurat', 'Berkelanjutan', 'Tidak Rutin', NULL, '2021-06-08 12:54:30', '2021-06-08 12:54:30'),
(16, 'Ucup', 'ucup@gmail.com', '$2y$10$B2vOn794vsCn5GK78gmEMOlmIH/zm3wsbLffdUXyh8qk6pSFNIboC', 'NO. 005/YBMPLN/UIPJBT/III/2021', 'Individu', 'Ciwidey', 'layak', 'Dery Rochan', 'Tunai', '7315008603', 'BCA', 'Dery Rochan', 'Dana Progran Bulanan April 2021', '1000000', 'undraw_profile.svg', 'Kesehatan', 'Aktif', 'ADMIN', '085846524135', 'Miskin', 'Darurat', 'Berkelanjutan', 'Tidak Rutin', 'IG : @ucupsaracup123', '2021-06-08 13:37:12', '2021-06-08 13:37:12'),
(17, 'zandari', 'zandari@gmai.com', '$2y$10$gknuiUjChDC/WUXM2PRUleqLtIjZaXO18efoTfWKFvbzCeRE/0sJS', 'NO. 006/YBMPLN/UIPJBT/III/2021', 'Individu', 'Sumedang', 'layak', 'Elan Sunarlan (Amil)', 'Transfer', '7108177138', 'BSI', 'Elan Sunarlan', 'Dana Progran Bukanan Maret 2021', '2500000', 'undraw_profile.svg', 'Pendidikan', 'Non-Aktif', 'ADMIN', NULL, 'Miskin', 'Tidak Darurat', 'Tidak Berkelanjutan', 'Tidak Rutin', NULL, '2021-06-08 14:30:08', '2021-06-08 14:30:08'),
(18, 'udin', 'Udin@gmail.com', '$2y$10$KM5Ww39Z6Vh8BKiewCtN1uVSgOqX3SqAELRGscsCuUZtOoQFs4HPW', 'NO. 007/YBMPLN/UIPJBT/III/2021', 'Individu', 'Sumedang', 'layak', 'Elan Sunarlan (Amil)', 'Transfer', '7108177138', 'BSI', 'Elan Sunarlan', 'Dana Progran Bukanan Maret 2021', '2500000', 'undraw_profile.svg', 'Pendidikan', 'Non-Aktif', 'ADMIN', NULL, 'Miskin', 'Tidak Darurat', 'Tidak Berkelanjutan', 'Tidak Rutin', NULL, '2021-06-08 14:30:17', '2021-06-08 14:30:17'),
(19, 'Dede Wandi', 'dede@gmail.com', '$2y$10$yyV748EWSJ.jKK8O43ceO.C1YkN79ekegJgiSpvLldXPDjz7ah5w.', 'NO. 008/YBMPLN/UIPJBT/III/2021', 'Individu', 'Rancabali', 'layak', 'Elan Sunarlan (Amil)', 'Transfer', '7108177138', 'BSI', 'Elan Sunarlan', 'Dana Progran Bukanan Maret 2021', '3000000', 'undraw_profile.svg', 'Pendidikan', 'Aktif', 'ADMIN', NULL, 'Miskin', 'Tidak Darurat', 'Berkelanjutan', 'Rutin', NULL, '2021-06-08 14:30:12', '2021-06-08 14:30:12'),
(20, 'Fajar', 'fajar@gmail.com', '$2y$10$fsJDsGFxO2h1uoQA.oy2VuC8ELtoio0CBH/fJRK2qA8JVKqNyAMom', 'NO. 009/YBMPLN/UIPJBT/III/2021', 'Individu', 'cirebon', 'layak', 'Elan Sunarlan (Amil)', 'Tunai', '7108177138', 'BSI', 'Elan Sunarlan', 'Dana Progran Bukanan Maret 2021', '1500000', 'undraw_profile.svg', 'Kesehatan', 'Aktif', 'ADMIN', NULL, 'Fakir', 'Tidak Darurat', 'Berkelanjutan', 'Rutin', NULL, '2021-06-08 12:54:19', '2021-06-08 12:54:19'),
(21, 'Bintang', 'bintang@gmail.com', '$2y$10$LWUwpeQ2noX3cd.oTpwnz.mW5m/fZDvjylpugqdH0xal.7ayc6SMK', 'NO. 010/YBMPLN/UIPJBT/III/2021', 'Individu', 'Cibiru', 'layak', 'Elan Sunarlan (Amil)', 'Tunai', '7315008603', 'BCA', 'Elan Sunarlan', 'Dana Progran Bulanan April 2021', '2000000', 'undraw_profile.svg', 'Ekonomi', 'Non-Aktif', 'ADMIN', NULL, 'Fakir', 'Tidak Darurat', 'Tidak Berkelanjutan', 'Tidak Rutin', NULL, '2021-06-08 12:57:31', '2021-06-08 12:57:31'),
(22, 'firda', 'firda@gmail.com', '$2y$10$BuLe0ekqwUI6QArItpixi.tQnecUj/6sxkjLAKHm.e1Fnkqcl.u7i', 'NO. 011/YBMPLN/UIPJBT/III/2021', 'Individu', 'Majalaya', 'layak', 'Dery Rochan', 'Tunai', '7315008603', 'BCA', 'Dery Rochan', 'Dana Progran Bulanan Maret 2021', '1000000', 'undraw_profile.svg', 'Ekonomi', 'Aktif', 'ADMIN', NULL, 'Miskin', 'Tidak Darurat', 'Tidak Berkelanjutan', 'Tidak Rutin', NULL, '2021-06-08 12:57:24', '2021-06-08 12:57:24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengajuan_dana`
--

CREATE TABLE `pengajuan_dana` (
  `id` int(11) NOT NULL,
  `total_pengajuan` varchar(100) NOT NULL,
  `ket_dana` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `penerima_manfaat_id` int(11) NOT NULL,
  `status_dana` enum('Diterima','Ditolak','Belum Dikonfirmasi') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pengajuan_dana`
--

INSERT INTO `pengajuan_dana` (`id`, `total_pengajuan`, `ket_dana`, `created_at`, `updated_at`, `penerima_manfaat_id`, `status_dana`) VALUES
(34, '1000000', 'bayar spp bulanan', '2021-05-06 13:49:51', '2021-06-08 13:54:23', 12, 'Diterima'),
(35, '1000000', 'butuh biaya tambahan', '2021-05-18 13:48:53', '2021-06-08 13:54:29', 13, 'Belum Dikonfirmasi'),
(36, '2000000', 'darurat', '2021-06-01 13:49:55', '2021-06-08 13:54:32', 14, 'Ditolak'),
(37, '1500000', 'butuh tambahan', '2021-06-08 13:56:03', '2021-06-08 13:56:03', 16, 'Belum Dikonfirmasi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penggunaan_dana`
--

CREATE TABLE `penggunaan_dana` (
  `id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `keterangan` text NOT NULL,
  `jenis` enum('Pemasukan','Pengeluaran') NOT NULL,
  `status_laporan` enum('Belum Dikonfirmasi','Diterima','Ditolak') NOT NULL,
  `nominal` varchar(100) NOT NULL,
  `bukti_pembayaran` varchar(200) NOT NULL,
  `penerima_manfaat_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `penggunaan_dana`
--

INSERT INTO `penggunaan_dana` (`id`, `tanggal`, `keterangan`, `jenis`, `status_laporan`, `nominal`, `bukti_pembayaran`, `penerima_manfaat_id`, `created_at`, `updated_at`) VALUES
(16, '2021-06-04', 'biaya kebutuhan sehari-hari', 'Pengeluaran', 'Diterima', '500000', '1623147203619.jpeg', 12, '2021-06-08 10:31:28', '2021-06-08 10:31:28'),
(17, '2021-06-08', 'bayar spp', 'Pengeluaran', 'Ditolak', '1000000', '1623148322130.png', 12, '2021-06-08 15:05:04', '2021-06-08 15:05:04'),
(18, '2021-05-13', 'belanja alat dapur', 'Pengeluaran', 'Diterima', '4000000', '1623161122942.png', 14, '2021-06-08 15:05:08', '2021-06-08 15:05:08'),
(19, '2021-06-01', 'hasil wirausaha', 'Pemasukan', 'Belum Dikonfirmasi', '1000000', '1623161155392.png', 14, '2021-06-08 14:05:55', '2021-06-08 14:05:55'),
(20, '2021-06-02', 'bayar spp', 'Pengeluaran', 'Belum Dikonfirmasi', '1000000', '1623161223141.png', 18, '2021-06-08 14:07:03', '2021-06-08 14:07:03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'undraw_profile.svg',
  `roles` enum('ADMIN','MITRA') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Aktif','Non-Aktif') COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `nama`, `foto`, `roles`, `status`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(10, 'Ahmad Hilmy Muflih', '1623137630785.png', 'ADMIN', 'Aktif', 'ahmadhilmy0918@gmail.com', NULL, '$2y$10$9kWsv6agOGFob7mDsamin.jJEKmqvwrSQXWD4mE0RTgchJ8MDec76', NULL, '2021-06-08 07:33:05', '2021-06-08 07:33:50'),
(11, 'Fadli', 'undraw_profile.svg', 'ADMIN', 'Non-Aktif', 'fadli@gmail.com', NULL, '$2y$10$fRblCG5ctXiP7kEuX/0BQOJQ//XSDFHQlADFJ1ZWnvCLYlfx1QdE6', NULL, '2021-06-08 07:34:09', '2021-06-08 12:57:49'),
(12, 'Siti Nurholipah', '1623233105919.jpg', 'MITRA', 'Aktif', 'sitiinurholipah1706@gmail.com', NULL, '$2y$10$dLtvMSlgdj6SG82Yrzm/ie7GBAL2Yie71KPZvYAhR0VqaHErO3eb6', NULL, '2021-06-08 07:35:28', '2021-06-09 10:07:55'),
(13, 'ahmad', 'undraw_profile.svg', 'MITRA', 'Aktif', 'ahm190711@gmail.com', NULL, '$2y$10$pw9qP7pkYgN8HMXFOunlQeIZZQZ4LSfG2ABas7826zDBycbyvm8KG', NULL, '2021-06-08 12:40:36', '2021-06-08 12:40:36'),
(14, 'Fahriza', '1623233383104.jpeg', 'MITRA', 'Aktif', 'fahriza@gmail.com', NULL, '$2y$10$aMkHiBN8w66ebj/jzI9pAeY96Sw3eS9WS2nQtR3tCvXWupY5IrI5C', NULL, '2021-06-08 12:41:49', '2021-06-09 10:09:44'),
(15, 'Tatang', 'undraw_profile.svg', 'MITRA', 'Non-Aktif', 'Tatang@gmail.com', NULL, '$2y$10$QHAwpr1R9ATMbTHOwF9Wouxza53rIDGbAHmH6w6duqnU55qcgZEES', NULL, '2021-06-08 12:43:19', '2021-06-08 12:54:29'),
(16, 'Ucup', 'undraw_profile.svg', 'MITRA', 'Aktif', 'ucup@gmail.com', NULL, '$2y$10$GdvF3D34aUEWHWiha9vktui8NHUO8iWU7gpx8/7xGA6lLJIpdU2EG', NULL, '2021-06-08 12:49:52', '2021-06-08 13:37:12'),
(17, 'zandari', 'undraw_profile.svg', 'MITRA', 'Non-Aktif', 'zandari@gmai.com', NULL, '$2y$10$f7hFHgHnXzNRsmGachX0PerJaTyoxuXz7qCQ0DTSTqjGZe5Xph3Mm', NULL, '2021-06-08 12:51:24', '2021-06-08 13:37:11'),
(18, 'udin', 'undraw_profile.svg', 'MITRA', 'Non-Aktif', 'Udin@gmail.com', NULL, '$2y$10$yk5QGQLAb2JISPCE9UVqSuebpNPedlDWfe4zTFn6xcjhtxEi7yvWa', NULL, '2021-06-08 12:52:13', '2021-06-08 12:54:24'),
(19, 'Dede Wandi', 'undraw_profile.svg', 'MITRA', 'Aktif', 'dede@gmail.com', NULL, '$2y$10$IRqa1ACijO1J6zrWB.4EK.Ihl.7tBh9nv8i1TzlrnQEtIdYfzgkEu', NULL, '2021-06-08 12:53:21', '2021-06-08 12:53:21'),
(20, 'Fajar', 'undraw_profile.svg', 'MITRA', 'Aktif', 'fajar@gmail.com', NULL, '$2y$10$FwHB5Sd3Xv9AB/VnERCr1.PJjiL1dP0wesAvTZJOnPk5da0nssbsu', NULL, '2021-06-08 12:54:19', '2021-06-08 12:54:19'),
(21, 'Bintang', 'undraw_profile.svg', 'MITRA', 'Non-Aktif', 'bintang@gmail.com', NULL, '$2y$10$7QFFYFtskptPPPGBDRRnS.XH3ryC.dgi0AJnVFJ8ScCOePCy7mVam', NULL, '2021-06-08 12:56:06', '2021-06-08 12:57:31'),
(22, 'firda', 'undraw_profile.svg', 'MITRA', 'Aktif', 'firda@gmail.com', NULL, '$2y$10$cfahLvIei7nDjsI9Dr0hp.3gCqyf7YfwkbYUXDa7/pGaNTaC1hAWq', NULL, '2021-06-08 12:57:24', '2021-06-08 12:57:24'),
(23, 'Ghifari', 'undraw_profile.svg', 'ADMIN', 'Aktif', 'ghifari@gmail.com', NULL, '$2y$10$XazGK5nhxO3w4AgX44kwxuxz1lrzm3RiCv8f2hcBAq00OKvdvGFHC', NULL, '2021-06-08 12:58:03', '2021-06-08 12:58:10');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `laporan_prestasi`
--
ALTER TABLE `laporan_prestasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_laporan_prestasi_1_idx` (`penerima_manfaat_id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `penerima_manfaat`
--
ALTER TABLE `penerima_manfaat`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pengajuan_dana`
--
ALTER TABLE `pengajuan_dana`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pengajuan_dana_1_idx` (`penerima_manfaat_id`);

--
-- Indeks untuk tabel `penggunaan_dana`
--
ALTER TABLE `penggunaan_dana`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_penggunaan_dana_1_idx` (`penerima_manfaat_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `laporan_prestasi`
--
ALTER TABLE `laporan_prestasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `penerima_manfaat`
--
ALTER TABLE `penerima_manfaat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `pengajuan_dana`
--
ALTER TABLE `pengajuan_dana`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT untuk tabel `penggunaan_dana`
--
ALTER TABLE `penggunaan_dana`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `laporan_prestasi`
--
ALTER TABLE `laporan_prestasi`
  ADD CONSTRAINT `fk_laporan_prestasi_1` FOREIGN KEY (`penerima_manfaat_id`) REFERENCES `penerima_manfaat` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `pengajuan_dana`
--
ALTER TABLE `pengajuan_dana`
  ADD CONSTRAINT `fk_pengajuan_dana_1` FOREIGN KEY (`penerima_manfaat_id`) REFERENCES `penerima_manfaat` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `penggunaan_dana`
--
ALTER TABLE `penggunaan_dana`
  ADD CONSTRAINT `fk_penggunaan_dana_1` FOREIGN KEY (`penerima_manfaat_id`) REFERENCES `penerima_manfaat` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
