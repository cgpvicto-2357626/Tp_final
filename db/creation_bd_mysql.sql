DROP DATABASE IF EXISTS gestion_bibliotheque;
CREATE DATABASE IF NOT EXISTS gestion_bibliotheque;
USE gestion_bibliotheque;

-- table: bibliotheque
CREATE TABLE IF NOT EXISTS bibliotheque (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    courriel VARCHAR(255) NOT NULL UNIQUE,
    cle_api VARCHAR(30)  NOT NULL,
    password VARCHAR(100) NOT NULL
);

-- table: livres
CREATE TABLE IF NOT EXISTS livres (
    id  INTEGER PRIMARY KEY AUTO_INCREMENT,
    bibliotheque_id INTEGER NOT NULL,
    titre VARCHAR(100) NOT NULL,
    auteur VARCHAR(100) NOT NULL,
    isbn VARCHAR(20) NOT NULL,
    date_ajout DATE NOT NULL DEFAULT (CURRENT_DATE),
    disponible TINYINT(1) NOT NULL DEFAULT 1,
    FOREIGN KEY (bibliotheque_id) REFERENCES bibliotheque(id) ON DELETE CASCADE
);

-- table: prets
CREATE TABLE IF NOT EXISTS prets (
id INTEGER PRIMARY KEY AUTO_INCREMENT,
livre_id INTEGER NOT NULL,
emprunteur VARCHAR(100) NOT NULL,
date_retour DATE NOT NULL,
status ENUM('actif', 'retourné') NOT NULL DEFAULT 'actif',
FOREIGN KEY (livre_id) REFERENCES livres(id) ON DELETE CASCADE
);

-- données initiales pris de IA
INSERT INTO bibliotheque (nom, courriel, cle_api, password) VALUES
('Maktaba El Arous', 'elarous@maktaba.tn', '82f49f8a-a6f9-4abf-a641-5bb89fec30d8', 'password123'),
('Maktaba Carthage', 'carthage@maktaba.tn', '08ce6b81-c791-444c-8a12-24c918c770b3', 'password123');

INSERT INTO livres (bibliotheque_id, titre, auteur, isbn, date_ajout, disponible) VALUES
(1, 'El Ayyam', 'Taha Hussein', '978-9-97-340001-1', '2025-01-10', 1),
(1, 'Awlad Haretna', 'Naguib Mahfouz', '978-9-77-416203-2', '2025-01-15', 0),
(1, 'El Hob Tahta El Matar', 'Nizar Qabbani', '978-9-95-370012-3', '2025-02-01', 1),
(2, 'Doha El Islam', 'Ahmad Amin', '978-9-77-214056-4', '2025-01-20', 1),
(2, 'El Mouallem', 'Mahmoud Messadi', '978-9-97-310023-5', '2025-03-05', 1);

INSERT INTO prets (livre_id, emprunteur, date_retour, status) VALUES
(2, 'Mohamed Ben Ali', '2026-05-01', 'actif');