-- table: bibliotheque
CREATE TABLE IF NOT EXISTS bibliotheque (
id SERIAL PRIMARY KEY,
nom VARCHAR(100) NOT NULL,
courriel VARCHAR(255) NOT NULL UNIQUE,
cle_api VARCHAR(36) NOT NULL, -- changement de 30 à 36 parce que UUID fait 36 caractères
password VARCHAR(100) NOT NULL
);

-- table: livres
CREATE TABLE IF NOT EXISTS livres (
id SERIAL PRIMARY KEY,
bibliotheque_id INTEGER NOT NULL,
titre VARCHAR(100) NOT NULL,
auteur VARCHAR(100) NOT NULL,
isbn VARCHAR(20) NOT NULL,
date_ajout DATE NOT NULL DEFAULT CURRENT_DATE,
disponible BOOLEAN NOT NULL DEFAULT TRUE,
FOREIGN KEY (bibliotheque_id) REFERENCES bibliotheque(id) ON DELETE CASCADE
);

-- table: prets
CREATE TABLE IF NOT EXISTS prets (
id SERIAL PRIMARY KEY,
livre_id INTEGER NOT NULL,
emprunteur VARCHAR(100) NOT NULL,
date_retour DATE NOT NULL,
statut VARCHAR(10) NOT NULL DEFAULT 'actif' CHECK (statut IN ('actif', 'retourné')), -- statut du prêt pour modifer un statut
FOREIGN KEY (livre_id) REFERENCES livres(id) ON DELETE CASCADE
);

-- donnés inspiré du IA
INSERT INTO bibliotheque (nom, courriel, cle_api, password) VALUES
('Maktaba El Arous', 'elarous@maktaba.tn', '82f49f8a-a6f9-4abf-a641-5bb89fec30d8', 'password123'),
('Maktaba Carthage', 'carthage@maktaba.tn', '08ce6b81-c791-444c-8a12-24c918c770b3', 'password123');

INSERT INTO livres (bibliotheque_id, titre, auteur, isbn, date_ajout, disponible) VALUES
(1, 'El Ayyam', 'Taha Hussein', '978-9-97-340001-1', '2025-01-10', TRUE),
(1, 'Awlad Haretna', 'Naguib Mahfouz', '978-9-77-416203-2', '2025-01-15', FALSE),
(1, 'El Hob Tahta El Matar', 'Nizar Qabbani', '978-9-95-370012-3', '2025-02-01', TRUE),
(2, 'Doha El Islam', 'Ahmad Amin', '978-9-77-214056-4', '2025-01-20', TRUE),
(2, 'El Mouallem', 'Mahmoud Messadi', '978-9-97-310023-5', '2025-03-05', TRUE);

INSERT INTO prets (livre_id, emprunteur, date_retour, statut) VALUES
(2, 'Mohamed Ben Ali', '2026-05-01', 'actif');
