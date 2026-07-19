----Course Table

CREATE TABLE `course` (
  `course_id` INT(10) NOT NULL AUTO_INCREMENT,
  `course_code` VARCHAR(10) NOT NULL,
  `course_name` VARCHAR(100) DEFAULT NULL,
  `program_id` INT(10) DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  UNIQUE KEY `course_code` (`course_code`),
  FOREIGN KEY (`program_id`) REFERENCES `program`(`program_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `course` (`course_code`, `course_name`, `program_id`) VALUES
('CSED101', 'Computer Engineering', 1),
('ACCT101', 'Accounting', 2),
('CSSD201', 'Computer Science', 3),
('INFT101', 'Information Technology', 4),
('CSED201', 'Computer Engineering', 5),
('ACCT201', 'Accounting', 6),
('NETW101', 'Networking', 7),
('CSSD301', 'Computer Science', 8),
('CYBS101', 'Cyber Security', 9),
('SWEN101', 'Software Engineering', 10);

-- ============================================================
----`results` around course_id

ALTER TABLE `results`
  ADD COLUMN `course_id` INT(10) DEFAULT NULL AFTER `program_id`,
  ADD FOREIGN KEY (`course_id`) REFERENCES `course`(`course_id`);

UPDATE `results` r
JOIN `course` c ON c.program_id = CAST(r.program_id AS UNSIGNED)
SET r.course_id = c.course_id
WHERE r.program_id REGEXP '^[0-9]+$';


-- Top 3 scores in CSSD201 with student names

SELECT s.student_name, r.score
FROM results r
JOIN course c ON r.course_id = c.course_id
JOIN student s ON r.student_id = s.student_id
WHERE c.course_code = 'CSSD201'
ORDER BY r.score DESC
LIMIT 3;