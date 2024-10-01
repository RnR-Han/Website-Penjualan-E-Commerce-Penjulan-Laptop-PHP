-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 01 Des 2021 pada 17.41
-- Versi server: 10.4.16-MariaDB
-- Versi PHP: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_sultan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`, `nama_lengkap`) VALUES
(1, 'han.com', '123456', 'raihan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(5) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Home'),
(2, 'Business'),
(3, 'Editing'),
(4, 'Gaming');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ongkir`
--

CREATE TABLE `ongkir` (
  `id_ongkir` int(5) NOT NULL,
  `nama_kota` varchar(100) NOT NULL,
  `tarif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `ongkir`
--

INSERT INTO `ongkir` (`id_ongkir`, `nama_kota`, `tarif`) VALUES
(1, 'Tangerang', 6000),
(2, 'Jakarta', 10000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `email_pelanggan` varchar(100) NOT NULL,
  `password_pelanggan` varchar(50) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `telepon_pelanggan` varchar(25) NOT NULL,
  `foto_pelanggan` varchar(100) NOT NULL,
  `alamat_pelanggan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `email_pelanggan`, `password_pelanggan`, `nama_pelanggan`, `telepon_pelanggan`, `foto_pelanggan`, `alamat_pelanggan`) VALUES
(1, 'adi@gmail.com', '654321', 'NurMHariadi', '0895333387855', '', ''),
(2, 'dimas@gmail.com', '111111', 'Dimas Prasetyo', '081210672585', '', ''),
(9, 'han22@gmail.com', '12345678', '111', '22', '', ''),
(10, 'han2222@gmail.com', '12345678', 'Han', '087136981209', '', ''),
(11, 'ilham@gmail.com', '123456', 'Ilham ', '089322115672', '', 'Tangerang sibung jaya');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `bank` varchar(255) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `bukti` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_pembelian`, `nama`, `bank`, `jumlah`, `tanggal`, `bukti`) VALUES
(22, 52, 'Adi', 'SENTRAL', 16909000, '2021-11-25', '20211125012525IMG-20210921-WA0009.jpg'),
(23, 53, 'Adi', 'BCA', 25210000, '2021-11-25', '20211125015019IMG-20210921-WA0009.jpg'),
(24, 52, 'M.Raihan Nova Ramzy', 'BNI', 16909000, '2021-11-25', '20211125101609IMG-20210921-WA0009.jpg'),
(25, 55, 'temen', 'Visa', 109408000, '2021-11-25', '20211125103127img044.jpg'),
(26, 54, 'adi', 'Simle', 16905000, '2021-11-25', '20211125111920img045.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_ongkir` int(11) NOT NULL,
  `tanggal_pembelian` date NOT NULL,
  `total_pembelian` int(11) NOT NULL,
  `nama_kota` varchar(100) NOT NULL,
  `tarif` int(11) NOT NULL,
  `alamat_pengiriman` text NOT NULL,
  `status_pembelian` varchar(100) NOT NULL DEFAULT 'pending',
  `resi_pengiriman` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `id_pelanggan`, `id_ongkir`, `tanggal_pembelian`, `total_pembelian`, `nama_kota`, `tarif`, `alamat_pengiriman`, `status_pembelian`, `resi_pengiriman`) VALUES
(52, 1, 2, '2021-11-25', 16909000, 'Jakarta', 10000, 'penjaringan', 'barang dikirim', '1111gg'),
(53, 1, 2, '2021-11-25', 25210000, 'Jakarta', 10000, 'Penjaringan', 'barang dikirim', 'ABCD123456'),
(54, 1, 1, '2021-11-25', 16905000, 'Tangerang', 6000, 'dmm', 'barang dikirim', 'ttttt'),
(55, 2, 2, '2021-11-25', 109408000, 'Jakarta', 10000, 'ceper', 'lunas', 'ANNN'),
(56, 1, 0, '2021-11-25', 15000000, '', 0, '', 'pending', ''),
(57, 1, 2, '2021-11-26', 15010000, 'Jakarta', 10000, 'penjaringan', 'pending', ''),
(58, 1, 0, '2021-12-01', 8320000, '', 0, '', 'pending', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian_produk`
--

CREATE TABLE `pembelian_produk` (
  `id_pembelian_produk` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `berat` int(11) NOT NULL,
  `subberat` int(11) NOT NULL,
  `subharga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pembelian_produk`
--

INSERT INTO `pembelian_produk` (`id_pembelian_produk`, `id_pembelian`, `id_produk`, `jumlah`, `nama`, `harga`, `berat`, `subberat`, `subharga`) VALUES
(1, 1, 1, 1, '', 0, 0, 0, 0),
(2, 1, 2, 1, '', 0, 0, 0, 0),
(3, 0, 7, 1, '', 0, 0, 0, 0),
(4, 0, 8, 1, '', 0, 0, 0, 0),
(5, 7, 8, 2, '', 0, 0, 0, 0),
(6, 7, 9, 1, '', 0, 0, 0, 0),
(7, 8, 7, 1, '', 0, 0, 0, 0),
(8, 1, 1, 1, '', 0, 0, 0, 0),
(9, 1, 1, 1, '', 0, 0, 0, 0),
(10, 1, 1, 1, '', 0, 0, 0, 0),
(11, 1, 1, 1, '', 0, 0, 0, 0),
(12, 1, 1, 1, '', 0, 0, 0, 0),
(13, 1, 2, 1, '', 0, 0, 0, 0),
(14, 1, 1, 1, '', 0, 0, 0, 0),
(15, 1, 2, 1, '', 0, 0, 0, 0),
(16, 16, 8, 1, '', 0, 0, 0, 0),
(17, 17, 7, 1, 'Asus RoG', 25000000, 1000, 1000, 25000000),
(18, 17, 8, 1, 'ASUS TUf', 15000000, 1000, 1000, 15000000),
(19, 18, 7, 1, 'Asus RoG', 25200000, 1000, 1000, 25200000),
(20, 0, 9, 1, 'Asus Zenbook', 16899000, 1000, 1000, 16899000),
(21, 0, 8, 1, 'ASUS TUf', 15000000, 1000, 1000, 15000000),
(22, 19, 7, 1, 'Asus RoG', 25200000, 1000, 1000, 25200000),
(23, 0, 8, 1, 'ASUS TUf', 15000000, 1000, 1000, 15000000),
(24, 0, 8, 1, 'ASUS TUf', 15000000, 1000, 1000, 15000000),
(25, 0, 8, 1, 'ASUS TUf', 15000000, 1000, 1000, 15000000),
(26, 0, 7, 1, 'Asus RoG', 25200000, 1000, 1000, 25200000),
(27, 20, 9, 1, 'Asus Zenbook', 16899000, 1000, 1000, 16899000),
(28, 21, 8, 1, 'ASUS TUf', 15000000, 1000, 1000, 15000000),
(29, 22, 7, 1, 'Asus RoG', 25200000, 1000, 1000, 25200000),
(30, 23, 7, 1, 'Asus RoG', 25200000, 1000, 1000, 25200000),
(31, 25, 8, 1, 'ASUS TUf', 15000000, 1000, 1000, 15000000),
(32, 26, 9, 1, 'Asus Zenbook', 16899000, 1000, 1000, 16899000),
(33, 28, 7, 1, 'Asus RoG', 25200000, 1000, 1000, 25200000),
(34, 29, 7, 1, 'Asus RoG', 25200000, 1000, 1000, 25200000),
(35, 36, 8, 1, 'ASUS TUf', 15000000, 1000, 1000, 15000000),
(36, 39, 8, 1, 'ASUS TUf', 15000000, 1000, 1000, 15000000),
(37, 40, 8, 2, 'ASUS TUf', 15000000, 1000, 2000, 30000000),
(38, 41, 9, 1, 'Asus Zenbook', 16899000, 1000, 1000, 16899000),
(39, 42, 8, 1, 'ASUS TUf', 15000000, 1000, 1000, 15000000),
(40, 43, 8, 1, 'ASUS TUf', 15000000, 1000, 1000, 15000000),
(41, 44, 7, 1, 'Asus RoG', 25200000, 1000, 1000, 25200000),
(42, 45, 7, 2, 'Asus RoG', 25200000, 1000, 2000, 50400000),
(43, 46, 7, 3, 'Asus RoG', 25200000, 1000, 3000, 75600000),
(44, 47, 8, 1, 'ASUS TUf', 15000000, 1000, 1000, 15000000),
(45, 48, 8, 1, 'ASUS TUf', 15000000, 1000, 1000, 15000000),
(46, 49, 7, 1, 'Asus RoG', 25200000, 1000, 1000, 25200000),
(47, 50, 8, 1, 'ASUS TUf', 15000000, 1000, 1000, 15000000),
(48, 51, 9, 1, 'Asus Zenbook', 16899000, 1000, 1000, 16899000),
(49, 52, 9, 1, 'Asus Zenbook', 16899000, 1000, 1000, 16899000),
(50, 53, 7, 1, 'Asus RoG', 25200000, 1000, 1000, 25200000),
(51, 54, 9, 1, 'Asus Zenbook', 16899000, 1000, 1000, 16899000),
(52, 55, 9, 2, 'Asus Zenbook', 16899000, 1000, 2000, 33798000),
(53, 55, 7, 3, 'Asus RoG', 25200000, 1000, 3000, 75600000),
(54, 56, 8, 1, 'ASUS TUf', 15000000, 1000, 1000, 15000000),
(55, 57, 10, 1, 'laptop pavilioni5', 15000000, 1200, 1200, 15000000),
(56, 58, 28, 1, 'Lenovo Ideapad Slim 3i', 8320000, 1400, 1400, 8320000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `id_kategori` int(5) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `harga_produk` int(11) NOT NULL,
  `berat_produk` int(11) NOT NULL,
  `foto_produk` varchar(100) NOT NULL,
  `deskripsi_produk` text NOT NULL,
  `stok_produk` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `id_kategori`, `nama_produk`, `harga_produk`, `berat_produk`, `foto_produk`, `deskripsi_produk`, `stok_produk`) VALUES
(2, 2, 'HP ElitBook x360 1030', 15900000, 1350, 'elitbooki5.png', 'Processor Intel® Core™ i7 processor 11th Generation\r\nMemory 4 GB/8 GB DDR4\r\nVGA  Intel® Iris® Xᵉ Graphics 	\r\nOS Windows 10 Pro 64\r\nStorage 1TB PCIe® NVMe™ M.2 SSD\r\nPixel 13.3\" diagonal, FHD (1920 x 1080), IPS, anti-glare, 250 nits, 45% NTSC\r\n\r\n', 50),
(3, 1, 'HP 14s', 5290000, 2400, '14si7.jpg', 'Os Windows 10 Home 64\r\nProcessor Intel® Core™ i3 processor 11th Generation\r\nMemory 4GB DDR4     \r\nStorage 256 GB PCIe® SSD\r\nPixel 14\" diagonal, FHD (1920 x 1080), IPS, micro-edge, BrightView, 250 nits, 45% NTSC<br> \r\nVGA Intel® UHD Graphics   		', 50),
(4, 2, 'Asus VivoBook', 10299000, 1250, 'vivobook.png', 'OS Windows 10 Home 64\r\nProcessor Intel® Core™ i7 processor 11th Generation \r\nResolusi  1920P x 1080P \r\nStorage 512 GB PCIe® SSD', 50),
(5, 2, 'Asus Zenbook Pro Duo', 40900000, 1400, 'zenbook.jpg', 'Processor Intel® Core™ i7 processor 10th Generation\r\nMemory16 GB ddr5\r\nStorage 1 TB PCIe® NVMe™ TLC SSD\r\nVGA RTX 2060, 6GB GDDR6', 50),
(6, 4, 'Asus RoG Zephyrus', 65999000, 2400, 'rog.jpg', 'Processor Intel® Core™ i9 processor 11th Generation \r\nVGA GeForce® RTX 3080 Laptop GPU\r\nStorage 2TB PCIe® NVMe™ M.2 SSD\r\nResolusi Layar 17.3\"', 50),
(7, 4, 'Asus TuF Dash 15', 15899000, 2500, 'tuf.png', 'Processor Intel® Core™ i7-11370H Processor 3.3 GHz\r\nVGA NVIDIA® GeForce RTX™ 3070 Laptop GPU, With ROG Boost up to 1390MHz at 80W (85W with Dynamic Boost), 8GB GDDR6\r\nMemory 8GB DDR4 on board, 8GB , Max Capacity : 32GB\r\nStorage 1TB M.2 NVMe™ PCIe® 3.0 SSD', 50),
(8, 2, 'Lenovo Ideapad Slim 3i', 8320000, 1200, 'ideapad slim 3i.jpg', '•	Processor Intel® Core™ i5-1035G1 processor\r\n\r\n•	Sistem Operasi Up to Windows 11 pro\r\n\r\n•	Tampilan 14\" FHD (1920 x 1080) IPS, 200 nits, 45% NTSC\r\n\r\n\r\n•	Penyimpanan Hingga 8GB DDR4\r\n\r\n•	Baterai Hingga 7,5 jam\r\n\r\n•	Storage 512GB SSD M.2 2242 NVME TLC\r\n', 50),
(9, 2, 'Lenovo Thinkbook 14', 16999900, 1200, 'Thinkbook 14.jpg', '•	Prosesor : Intel Core i7\r\n•	VGA : AMD Radeon 625 (2 GB)\r\n•	RAM : 24 GB DDR4\r\n•	HDD : 2 TB\r\n•	Layar : 14 inci\r\n•	OS : Windows 10 Pro 64 bit\r\n•	WLAN : WiFI 6\r\n•	Bluetooth : tipe 5.0\r\n•	Webcam : HD 720p dengan ThinkShutter\r\n•	Warna : Mineral Gray\r\n•	Port : HDMI, USB 3.1 tipe A dan C, 4 in 1 Card Reader, Audio Combo Jack, Hidden USB 2.0 Type-A\r\n•	Audio : Speaker stereo dengan Dolby Audio\r\n', 50),
(10, 4, 'Lenovo Legion 5i Pro', 28199000, 1850, 'Legion 5i Pro.png', '•	Processor intel core i7-11800H\r\n•	Windows 11\r\n•	NVIDIA Geforce RTX 3070 8 GB GDDR6\r\n•	Display 16\" WQXGA IPS (2560 x 1600), 500 nits, 16:10, 165Hz, 3ms response time, 100% sRGB, up to VESA DisplayHDR™ 400 certified, Dolby Vision support, NVIDIA® G-SYNC™, low blue light - TÜV Certification\r\n•	Ram 16GB DDR4 3200MHz\r\n•	Storage 1TB SSD\r\n', 50),
(11, 2, 'Lenovo Yoga Slim 7i Pro', 20099000, 1100, 'Yoga Slim 7i Pro.jpg', '•	Processor Intel Core i7 Gen 11\r\n•	Windows 11 \r\n•	Layar 14\" (16:10) 2.8K (2880x1800), 100%sRGB, 400 nits, Dolby Vision, Delta E<2 color accuracy, 243ppi, Glass only, 91% AAR\r\n•	Ram 16GB\r\n•	Storage 1TB M.2 PCIe SSD\r\n•	Graphics Intel Iris X, NVIDIA Geforce MX-450\r\n', 50),
(12, 1, 'Dell Vostro 14 3000 Series', 4999000, 1940, 'Dell Vostro 14 3000 series.png', 'Ukuran Layar	14-inci\r\nProsesor	Intel Core i3-4005U @1,7GHz\r\nGPU	 Intel HD Graphics Family\r\nRAM	4 GB\r\nPenyimpanan	500 GB\r\nPaket Penjualan	Adapter, Manual, Setup Instruction, Warranty Card.\r\n', 50),
(13, 2, 'DELL LATITUDE ', 7990000, 1200, 'Dell Latitude.jpg', 'Processor: Intel® Core™ i3-10110U Processor 4M Cache, up to 4.10 GHz\r\nRAM: 4GB DDR4\r\nHDD : 1TB\r\nVGA: Intel® UHD Graphics\r\nKonektivitas: Wifi + Bluetooth\r\nUkuran Layar: 14 Inch HD\r\nSistem Operasi: Windows 10 HOME\r\n', 50),
(14, 4, 'Laptop Dell Alienware M14x', 17799000, 2200, 'Dell Alienware M14x.jpg', 'Ukuran (L x W x H mm)	33.7 x 37.8 x 2.6\r\nLayar	1600 x 900 pixels, Glossy LCD with LED Backlight\r\nOS	Microsoft Windows 7 Home Premium\r\nCPU	Intel Core i7 – Speed 2300 GHz\r\nMemori/RAM	4 GB DDR3 1600 GHz\r\nKartu Grafis	NVIDIA GeForce GT 650M\r\nTouch Screen	Ya ( mendukung 10 jari bersamaan )\r\nHarddisk	750 GB\r\nSpeaker	Stereo\r\nKoneksi	Bluetoth, WiFi\r\nPort USB	USB 3.0 Terbaru\r\nHDMI	Ya\r\nSlot	Memory Stick, SD/MMC Card, SDHC Card, xD-Picture Card\r\nBaterai	5:03  (hh:mm)\r\n\r\n', 50),
(15, 2, 'Surface Pro 4 Series m3', 12450000, 770, 'i3surfacepro4-removebg-preview.png', '>Window 10 Pro 64\r\n>6th Generation Intel® Core™ m3\r\n>4GB RAM DDR3\r\n>Solid state drive (SSD) options: 128GB,\r\n>Screen: 12.3” PixelSense™ Display Resolution: 2736 x 1824 (267 PPI) Aspect Ratio: 3:2 Touch: 10 point multi-touch\r\n>11.50” x 7.93” x 0.33” (292.10mm x 201.42mm x 8.45mm)\r\n>M3: Intel® HD graphics 515 \r\n>Ports full-size USB 3.0 microSD™ card reader Surface Connect™ Headset jack Mini DisplayPort Cover port\r\n>Cameras, video, and audio Windows Hello face sign-in camera (front-facing) 5.0MP front-facing camera with 1080p HD video 8.0MP rear-facing autofocus camera with 1080p HD video Stereo microphones Stereo speakers with Dolby® Audio™ Premium\r\n>Wireless 802.11ac Wi-Fi wireless networking IEEE 802.11a/b/g/n compatible Bluetooth Wireless 4.0 technology\r\n', 50),
(16, 2, 'Surface Pro 4 Series i5', 15600000, 790, 'i5surfacepro4-removebg-preview.png', '>Window 10 Pro 64\r\n>6th Generation Intel® Core™ i5-6300U 2.4-3GHz\r\n>8GB RAM DDR3\r\n>Solid state drive (SSD) options: 256GB\r\n>Screen: 12.3” PixelSense™ Display Resolution: 2736 x 1824 (267 PPI) Aspect Ratio: 3:2 Touch: 10 point multi-touch\r\n>11.50” x 7.93” x 0.33” (292.10mm x 201.42mm x 8.45mm)\r\n>I5: Intel® HD graphics 520\r\n>Ports full-size USB 3.0 microSD™ card reader Surface Connect™ Headset jack Mini DisplayPort Cover port\r\n', 50),
(17, 2, 'Surface Pro 4 Series i7', 24650000, 790, 'i7surfacepro4-removebg-preview.png', '>Window 10 Pro 64\r\n>6th Generation Intel® Core™ i7\r\n>16GB RAM DDR3\r\n>Solid state drive (SSD) options:512GB\r\n>Screen: 12.3” PixelSense™ Display Resolution: 2736 x 1824 (267 PPI) Aspect Ratio: 3:2 Touch: 10 point multi-touch\r\n>11.50” x 7.93” x 0.33” (292.10mm x 201.42mm x 8.45mm)\r\n>I7: Intel® Iris™ graphics\r\n>Ports full-size USB 3.0 microSD™ card reader Surface Connect™ Headset jack Mini DisplayPort Cover port\r\n>Cameras, video, and audio Windows Hello face sign-in camera (front-facing) 5.0MP front-facing camera with 1080p HD video 8.0MP rear-facing autofocus camera with 1080p HD video Stereo microphones Stereo speakers with Dolby® Audio™ Premium\r\n>Wireless 802.11ac Wi-Fi wireless networking IEEE 802.11a/b/g/n compatible Bluetooth Wireless 4.0 technology\r\n', 50),
(18, 1, 'Acer Swift 1 Fresh (SF114-34)', 6699000, 1300, 'Acer Swift 1 Fresh (SF114-34).jpg', '•	CPU                     Intel® Pentium® Silver N6000 Processor\r\n                                          ( 1.10 GHz, up to 3.30 GHz with Intel® Burst Technology)\r\n•	OS                         Windows 10 Home\r\n                                                        Pre-installed Office Home and Student 2019\r\n•	Display                  14.0″ display with IPS (In-Plane Switching) technology\r\n                FHD (1920 x 1080)\r\n                High-brightness (300nits)\r\n                Acer ComfyView™ LED-backlit TFT LCD\r\n              16:9 aspect ratio\r\n              72% NTSC color gamut\r\n              Wide viewing angle up to 170 degrees\r\n•	Memory               4GB of LPDDR4X\r\n•	Hardisk                512 GB SSD PCIe Gen3, 8 Gb/s, NVMe\r\n•	Graphic                Intel® UHD Graphics\r\n•	Bluetooth              Bluetooth 5.1\r\n•	ODD                       N/A\r\n•	Wifi                        Intel® Wireless Wi-Fi 6 AX201 with MU-MIMO\r\n•	Camera                  HD webcam with: \r\n1280 x 720 resolution;\r\n720p HD audio/video recording; \r\nSuper high dynamic range imaging (SHDR)\r\n•	Media Reader       N/A\r\n•	Audio                     DTS® Audio featuring optimized bass response and \r\n                                      micro-speaker distortion prevention. Acer Purified Voice \r\n                                      technology with two built-in microphones. \r\n                Compatible with Cortana with Voice\r\n•	I/O Port                    HDMI® port\r\n                1x USB Type-CTM port: USB 3.2 Gen 1 (up to 5 Gbps)\r\n                2x USB 3.2 Gen 1\r\n•	Security                   Fingerprint (Windows Hello Certified)\r\n•	Warranty                2/3/0 (Part/Labour/Onsite)\r\n•	Height (mm)            14.95\r\n•	Battery                     15 hours\r\n•	Color             Pure Silver, Sakura Pink, Safari Gold\r\n', 50),
(19, 2, 'Acer Swift 3', 8999000, 1500, 'Acer Swift 3.png', 'Operation System	Windows 10 Home\r\n\r\n\r\nProcessor	Intel® Core TMi5-6200U\r\n\r\nRAM	4GB DDR4\r\n\r\nStorage	256GB SSD\r\n\r\n\r\n\r\nDisplay	14” HD Acer ComfyViewTM with IPS \r\nTechnology\r\n\r\nBattery Life	Up to 12 hours\r\n\r\nThickness & Weight	Thickness: 17.95 mm\r\n\r\nPort	\r\n●                 USB 3.1 Type C,  USB  3.0,USB 2.0\r\n●                 Power Off USB Charging\r\n●                 HDMI\r\n\r\nWireless & Networking\r\nWLAN 802.11 ac 2×2 MU-MIMO Bluetooth 4.0\r\n\r\nColor Option	\r\n●                 Luxury gold\r\n●                 Sparkly silver\r\n', 50),
(20, 2, 'Acer Swift 7 ', 29050000, 1133, 'Acer Swift 7.jpg', 'Tampilan\r\n\r\n\r\nUkuran Layar 	13.3\" \r\n\r\nResolusi Layar 	1920 x 1080pixels \r\n\r\n\r\nTeknologi Layar 	LED\r\n\r\n\r\n\r\nProsesor\r\n\r\n\r\nSistem Operasi 	Windows 10 \r\n\r\nKecepatan CPU 	1.2GHz \r\n\r\nCPU 	Intel Core i5 \r\n\r\nBaterai\r\n\r\n\r\nDaya Tahan Baterai 	9h \r\n\r\nFitur\r\n\r\n-	Backlit Keyboard 	\r\n-	Layar Sentuh 	\r\n-	Fingerprint Reader 	\r\n\r\nDesain\r\n\r\n\r\nMaterial Bodi 	Aluminium \r\n\r\nPenyimpanan\r\n\r\nTipe Penyimpanan 	SSD \r\n\r\nPenyimpanan 	256GB\r\n \r\nGrafis\r\n\r\nGraphic Card 	Intel Integrated HD Graphics \r\n\r\nConnector Ports\r\n-	HDMI \r\n-	USB Type-C \r\n-	Headphone Jack \r\n-	Thunderbolt \r\n\r\nKamera\r\nResolusi Webcam 	HD \r\n\r\nMemori\r\nRAM 	8GB \r\nTipe RAM 	LPDDR3 SDRAM \r\n\r\nKoneksi\r\nWi-Fi Standard 	802.11ac \r\n\r\nPackaging Data\r\nGaransi 	1 Tahun \r\n', 50),
(21, 4, 'ACER NITRO 5 ', 47740000, 2500, 'Acer Nitro 5.jpg', 'Tampilan\r\n\r\nUkuran Layar 	15.6\" \r\n\r\nResolusi Layar 	1920 x 1080pixels \r\n\r\nTeknologi Layar 	LED \r\n\r\n\r\nProsesor\r\n\r\nSistem Operasi 	Windows 10 Home \r\n	\r\nKecepatan CPU 	2.5GHz \r\n\r\n\r\nBaterai\r\n\r\nDaya Tahan Baterai 	8h\r\n\r\n\r\n \r\nDesain\r\nMaterial Bodi 	Plastik \r\n\r\n\r\nPenyimpanan\r\n\r\nTipe Penyimpanan 	SSD \r\n\r\n\r\nGrafis\r\n\r\nGraphic Card 	NVIDIA\r\n \r\nConnector Ports\r\n\r\n-	HDMI \r\n-	USB 3.0 \r\n-	USB Type-C \r\n-	Headphone Jack \r\n-	USB 	\r\n-	Card Reader 	\r\nKamera\r\n\r\nResolusi Webcam 	HD \r\n\r\nMemori\r\n\r\nTipe RAM 	DDR4 \r\n\r\nKecepatan RAM 	2666MHz \r\n\r\nWarna\r\n\r\nWarna 	Hitam \r\n\r\nPackaging Data\r\n\r\nGaransi 	1 Tahun \r\n\r\nKoneksi\r\n\r\nWi-Fi Standard 	802.11ac \r\n\r\n\r\n\r\n', 50),
(22, 4, 'Acer Predator Helios 500', 25999000, 3500, 'Acer Predator Helios 500.jpg', 'OS                       : Windows 10 Home\r\nCPU                     : Intel® Core™ i9-8950HK\r\nGraphics             : NVIDIA® GeForce® GTX™ 1070\r\nMemory               : 4 slots, upgradable to 64 GB DDR4\r\nDisplay                 : 17,3” 4K UHD/FHD 144 Hz display with IPS technology, \r\n                                 supporting G-Sync\r\nStorage                 : 1 TB HDD\r\nThermal                : Dual AeroBlade 3D fans, CoolBoost fan control, 5 heat pipes\r\nNetwork                : Gigabit Ethernet (RJ 45) port, Bluetooth\r\nInput & Output    : 2 x USB Type-C 3.1 (Thunderbolt 3), 3 x USB 3.0, 1x HDMI 2.0 port, \r\n                                 1 x Display port\r\nKeyboard              : RGB backlit keyboard\r\nCamera                 : HD Webcam\r\nDimensions            : 428 x 300 x 38.7 mm\r\n', 50),
(23, 4, 'HP Pavilion Gaming Laptop 15- rtx 2060', 21999000, 2000, 'hppavelion.png', 'Processor Intel® Core™ i7 processor 11th Generation\r\nOs Windows 10 Home Single Language 64\r\nPixel 15.6\" diagonal, FHD (1920 x 1080), 144 Hz,IPS, micro-edge, anti-glare, 250 nits, 45% NTSC\r\nMemori 8 GB DDR4-3200 MHz RAM (1 x 8 GB)\r\nStorage 256 GB/512 GB PCIe® NVMe™ M.2 SSD    \r\nVGA NVIDIA® GeForce® GTX 1650 Laptop GPU\r\nPort 1 SuperSpeed USB Type-C® 10Gbps signaling rate ;  1 SuperSpeed USB Type-A 5Gbps signaling rate ;  2 SuperSpeed USB Type-A 5Gbps signaling rate; 1 HDMI 2.0; 1 RJ-45; 1 AC smart pin;  1 headphone/microphone combo \r\n', 50);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk_foto`
--

CREATE TABLE `produk_foto` (
  `id_produk_foto` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `nama_produk_foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `produk_foto`
--

INSERT INTO `produk_foto` (`id_produk_foto`, `id_produk`, `nama_produk_foto`) VALUES
(2, 25, 'WhatsApp Image 2021-11-16 at 12.52.56.jpeg'),
(9, 25, '20211130104252WhatsApp Image 2021-11-16 at 12.52.56 (1).jpeg'),
(10, 26, ''),
(11, 26, ''),
(12, 27, 'WhatsApp Image 2021-11-30 at 09.23.08.jpeg'),
(13, 28, 'ideapad slim 3i.jpg'),
(14, 29, 'Thinkbook 14.jpg'),
(15, 30, 'Legion 5i Pro.png'),
(16, 31, 'Yoga Slim 7i Pro.jpg'),
(17, 32, 'Dell Vostro 14 3000 series.png'),
(18, 33, 'Dell Latitude.jpg'),
(19, 34, 'Dell Alienware M14x.jpg'),
(20, 35, 'Yoga Slim 7i Pro.jpg'),
(21, 1, 'hppavelion.png'),
(22, 2, 'elitbooki5.png'),
(23, 3, '14si7.jpg'),
(24, 4, 'vivobook.png'),
(25, 5, 'zenbook.jpg'),
(26, 6, 'rog.jpg'),
(27, 7, 'tuf.png'),
(28, 8, 'ideapad slim 3i.jpg'),
(29, 9, 'Thinkbook 14.jpg'),
(30, 10, 'Legion 5i Pro.png'),
(31, 11, 'Yoga Slim 7i Pro.jpg'),
(32, 12, 'Dell Vostro 14 3000 series.png'),
(33, 13, 'Dell Latitude.jpg'),
(34, 14, 'Dell Alienware M14x.jpg'),
(35, 15, 'i3surfacepro4-removebg-preview.png'),
(36, 16, 'i5surfacepro4-removebg-preview.png'),
(37, 17, 'i7surfacepro4-removebg-preview.png'),
(38, 18, 'Acer Swift 1 Fresh (SF114-34).jpg'),
(39, 19, 'Acer Swift 3.png'),
(40, 20, 'Acer Swift 7.jpg'),
(41, 21, 'Acer Nitro 5.jpg'),
(42, 22, 'Acer Predator Helios 500.jpg'),
(43, 23, 'hppavelion.png');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `ongkir`
--
ALTER TABLE `ongkir`
  ADD PRIMARY KEY (`id_ongkir`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indeks untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indeks untuk tabel `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  ADD PRIMARY KEY (`id_pembelian_produk`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indeks untuk tabel `produk_foto`
--
ALTER TABLE `produk_foto`
  ADD PRIMARY KEY (`id_produk_foto`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `ongkir`
--
ALTER TABLE `ongkir`
  MODIFY `id_ongkir` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT untuk tabel `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  MODIFY `id_pembelian_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `produk_foto`
--
ALTER TABLE `produk_foto`
  MODIFY `id_produk_foto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
