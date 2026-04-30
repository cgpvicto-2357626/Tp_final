-- table: bibliotheque
CREATE TABLE IF NOT EXISTS bibliotheque (
id SERIAL PRIMARY KEY,
nom VARCHAR(100) NOT NULL,
courriel VARCHAR(255) NOT NULL UNIQUE,
cle_api VARCHAR(30) NOT NULL,
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
CREATE TABLE IF N
CREATE TABLE IF NOT EXISTS prets (
id SERIAL PRIMARY KEY,
livre_id INTEGER NOT NULL,
emprunteur VARCHAR(100) NOT NULL,
date_retour DATE NOT NULL,
FOREIGN KEY (livre_id) REFERENCES livres(id) ON DELETE CASCADE
);

-- donnés inspiré du IA
INSERT INTO bibliotheque (nom, courriel, cle_api, password) VALUES
('Bibliothèque Centrale', 'centrale@biblio.com', 'abc123', 'password123'),
('Bibliothèque Nord', 'nord@biblio.com', 'xyz456', 'password123');

INSERT INTO livres (bibliotheque_id, titre, auteur, isbn, date_ajout, disponible) VALUES
(1, 'Le Petit Prince', 'Antoine de Saint-Exupéry', '978-2-07-040850-4', '2025-01-10', TRUE),
(1, '1984', 'George Orwell', '978-0-45-228285-3', '2025-01-15', FALSE),
(1, 'Harry Potter', 'J.K. Rowling', '978-2-07-054189-0', '2025-02-01', TRUE),
(2, 'Les Misérables', 'Victor Hugo', '978-2-07-040908-2', '2025-01-20', TRUE),
(2, 'Dune', 'Frank Herbert', '978-2-07-036024-5', '2025-03-05', TRUE);

INSERT INTO prets (livre_id, emprunteur, date_retour) VALUES
(2, 'Jean Tremblay', '2026-05-01');
