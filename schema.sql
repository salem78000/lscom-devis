-- Structure de la base de données pour l'application LS COM

CREATE DATABASE IF NOT EXISTS lscom_appointments;
USE lscom_appointments;

-- Table des clients
CREATE TABLE clients (
  id VARCHAR(36) PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  phone VARCHAR(20) NOT NULL,
  address TEXT NOT NULL,
  category ENUM('visited', 'pending', 'quote_sent', 'quote_approved') NOT NULL,
  installation_type ENUM('tableau', 'borne_irve', 'depannage', 'autre') NOT NULL,
  electrical_details JSON,
  notes JSON,
  photos JSON,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  INDEX idx_email (email),
  INDEX idx_category (category)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table des rendez-vous
CREATE TABLE appointments (
  id VARCHAR(36) PRIMARY KEY,
  client_id VARCHAR(36) NOT NULL,
  date DATETIME NOT NULL,
  status ENUM('scheduled', 'completed', 'cancelled') NOT NULL,
  notes TEXT,
  photos JSON,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (client_id) REFERENCES clients(id) ON DELETE CASCADE,
  INDEX idx_client_id (client_id),
  INDEX idx_date (date),
  INDEX idx_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table des emplacements
CREATE TABLE locations (
  id VARCHAR(36) PRIMARY KEY,
  address TEXT NOT NULL,
  email VARCHAR(255),
  visit_date DATETIME NOT NULL,
  notes TEXT,
  photos JSON,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  INDEX idx_visit_date (visit_date)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;