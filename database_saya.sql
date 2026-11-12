-- =====================================
-- 1. MEMBUAT DATABASE
-- =====================================

CREATE DATABASE campus_cleancare
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE campus_cleancare;


-- =====================================
-- 2. TABEL USERS
-- Pelapor, Petugas, dan Admin
-- =====================================

CREATE TABLE users (
    id_user INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    nim VARCHAR(30) UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM(
        'Pelapor',
        'Petugas',
        'Admin'
    ) NOT NULL,
    no_hp VARCHAR(20),
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;


-- =====================================
-- 3. TABEL REPORTS
-- Data utama laporan sampah
-- =====================================

CREATE TABLE reports (
    id_report INT AUTO_INCREMENT PRIMARY KEY,
    kode_laporan VARCHAR(30) NOT NULL UNIQUE,

    pelapor_id INT NOT NULL,
    assigned_to INT NULL,

    deskripsi TEXT NOT NULL,

    latitude DECIMAL(10,8) NOT NULL,
    longitude DECIMAL(11,8) NOT NULL,
    alamat_lokasi VARCHAR(255),

    status ENUM(
        'Menunggu',
        'Diproses',
        'Selesai',
        'Dihapus'
    ) NOT NULL DEFAULT 'Menunggu',

    jumlah_upvote INT NOT NULL DEFAULT 0,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    assigned_at DATETIME NULL,
    completed_at DATETIME NULL,
    deleted_at DATETIME NULL,

    FOREIGN KEY (pelapor_id)
        REFERENCES users(id_user),

    FOREIGN KEY (assigned_to)
        REFERENCES users(id_user),

    INDEX idx_status (status),
    INDEX idx_created_at (created_at),
    INDEX idx_lokasi (latitude, longitude),
    INDEX idx_assigned_to (assigned_to)
) ENGINE=InnoDB;


-- =====================================
-- 4. TABEL REPORT_EVIDENCE
-- Foto Before dan After
-- =====================================

CREATE TABLE report_evidence (
    id_evidence INT AUTO_INCREMENT PRIMARY KEY,
    report_id INT NOT NULL,
    uploaded_by INT NOT NULL,

    evidence_type ENUM(
        'Before',
        'After'
    ) NOT NULL,

    file_path VARCHAR(255) NOT NULL,
    keterangan VARCHAR(255),

    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (report_id)
        REFERENCES reports(id_report),

    FOREIGN KEY (uploaded_by)
        REFERENCES users(id_user),

    INDEX idx_report_evidence (report_id)
) ENGINE=InnoDB;


-- =====================================
-- 5. TABEL REPORT_STATUS_HISTORY
-- Riwayat perubahan status laporan
-- =====================================

CREATE TABLE report_status_history (
    id_history INT AUTO_INCREMENT PRIMARY KEY,
    report_id INT NOT NULL,
    changed_by INT NULL,

    status_sebelumnya VARCHAR(20),
    status_baru VARCHAR(20) NOT NULL,

    catatan TEXT,
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (report_id)
        REFERENCES reports(id_report),

    FOREIGN KEY (changed_by)
        REFERENCES users(id_user),

    INDEX idx_report_history (report_id, changed_at)
) ENGINE=InnoDB;


-- =====================================
-- 6. TABEL REPORT_VOTES
-- Upvote laporan
-- =====================================

CREATE TABLE report_votes (
    id_vote INT AUTO_INCREMENT PRIMARY KEY,
    report_id INT NOT NULL,
    user_id INT NOT NULL,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (report_id)
        REFERENCES reports(id_report),

    FOREIGN KEY (user_id)
        REFERENCES users(id_user),

    UNIQUE KEY unique_report_vote (
        report_id,
        user_id
    )
) ENGINE=InnoDB;


-- =====================================
-- 7. TABEL ADMIN_ACTIONS
-- Catatan tindakan Admin
-- =====================================

CREATE TABLE admin_actions (
    id_action INT AUTO_INCREMENT PRIMARY KEY,
    admin_id INT NOT NULL,
    report_id INT NOT NULL,

    action ENUM(
        'Hapus Laporan',
        'Verifikasi Laporan'
    ) NOT NULL,

    reason TEXT NOT NULL,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (admin_id)
        REFERENCES users(id_user),

    FOREIGN KEY (report_id)
        REFERENCES reports(id_report)
) ENGINE=InnoDB;


-- =====================================
-- 8. TABEL NOTIFICATIONS
-- Notifikasi pengguna
-- =====================================

CREATE TABLE notifications (
    id_notification INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    report_id INT NULL,

    judul VARCHAR(150) NOT NULL,
    message TEXT NOT NULL,

    notification_type VARCHAR(50),
    is_read BOOLEAN NOT NULL DEFAULT FALSE,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    read_at DATETIME NULL,

    FOREIGN KEY (user_id)
        REFERENCES users(id_user),

    FOREIGN KEY (report_id)
        REFERENCES reports(id_report),

    INDEX idx_user_notification (
        user_id,
        is_read,
        created_at
    )
) ENGINE=InnoDB;

