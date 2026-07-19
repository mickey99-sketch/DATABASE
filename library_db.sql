-- Books table
CREATE TABLE books (
  book_id INT(11) NOT NULL AUTO_INCREMENT,
  title VARCHAR(150) NOT NULL,
  author VARCHAR(100) NOT NULL,
  year_published YEAR(4) NOT NULL,
  copies_available INT(11) DEFAULT 1,
  PRIMARY KEY (book_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO books (title, author, year_published, copies_available) VALUES
('Principles of Networking', 'Michael Cage', '2024', 10),
('Engineering Maths', 'Ben Gazy', '2021', 20),
('MobileApp Development', 'Don Ray', '2026', 40),
('Micro Processors', 'Justice Just', '2001', 15),
('Signals and Systems', 'Godfred Treasure', '2015', 5);

-- Books published after 2015, ordered by title
SELECT *
FROM books
WHERE year_published > 2015
ORDER BY title;