# 🏫 Sistem Pelaporan Limbah dan Kebersihan Kampus (RPL - Final)

Repositori ini berisi rancangan dan skema database untuk proyek mata kuliah **Rekayasa Perangkat Lunak (RPL)**. Sistem ini bertujuan mempermudah pelaporan masalah kebersihan serta pengelolaan limbah di lingkungan kampus.

---

## 📋 Daftar Isi
- [Tentang Proyek](#-tentang-proyek)
- [Teknologi yang Digunakan](#-teknologi-yang-digunakan)
- [Struktur File](#-struktur-file)
- [Cara Menjalankan Database](#-cara-menjalankan-database)
- [Tim Pengembang](#-tim-pengembang)

---

## 📖 Tentang Proyek
Aplikasi ini dirancang untuk mendukung lingkungan kampus yang bersih dan berkelanjutan dengan menyediakan fitur pelaporan cepat bagi mahasiswa dan staf, serta pemantauan tindak lanjut oleh petugas kebersihan.

## 🛠️ Teknologi yang Digunakan
* **Database:** MySQL (via Docker Container)
* **Manajemen Database:** phpMyAdmin
* **Version Control:** Git & GitHub

## 📂 Struktur File
| Nama File | Keterangan |
| :--- | :--- |
| `database_saya.sql` | File backup / dump struktur tabel dan query awal database |
| `README.md` | Dokumentasi utama repositori proyek |

## 🚀 Cara Menjalankan Database
1. Pastikan **Docker** dan **MySQL** sudah berjalan di komputer lokal.
2. Buat database baru bernama `pelaporan_kampus`.
3. Import file `.sql` menggunakan perintah terminal berikut:
   ```bash
   docker exec -i NAMA_CONTAINER mysql -u root -p pelaporan_kampus < database_saya.sql
