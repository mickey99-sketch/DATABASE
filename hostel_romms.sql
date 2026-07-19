
----ROOMS-----

CREATE TABLE rooms (
    room_id        INT AUTO_INCREMENT PRIMARY KEY,
    room_number    VARCHAR(10)    NOT NULL UNIQUE,
    room_type      ENUM('Single','Double','Triple','Dormitory') NOT NULL,
    floor_number   TINYINT UNSIGNED NOT NULL,
    capacity       TINYINT UNSIGNED NOT NULL,
    monthly_rent   DECIMAL(10,2)  NOT NULL,
    CHECK (capacity BETWEEN 1 AND 8)
) ENGINE=InnoDB;

 -----STUDENTS-------

CREATE TABLE students (
    student_id     INT AUTO_INCREMENT PRIMARY KEY,
    reg_number     VARCHAR(20)   NOT NULL UNIQUE,
    first_name     VARCHAR(50)   NOT NULL,
    last_name      VARCHAR(50)   NOT NULL,
    gender         ENUM('Male','Female') NOT NULL,
    date_of_birth  DATE          NOT NULL,
    phone          VARCHAR(15),
    email          VARCHAR(100)  UNIQUE,
    department     VARCHAR(60)   NOT NULL,
    year_of_study  TINYINT UNSIGNED NOT NULL
) ENGINE=InnoDB;


----- ALLOCATIONS-------

CREATE TABLE allocations (
    allocation_id   INT AUTO_INCREMENT PRIMARY KEY,
    student_id      INT NOT NULL,
    room_id         INT NOT NULL,
    allocation_date DATE NOT NULL,
    vacate_date     DATE NULL,
    status          ENUM('Active','Vacated') NOT NULL DEFAULT 'Active',

    CONSTRAINT fk_allocations_student
        FOREIGN KEY (student_id) REFERENCES students(student_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_allocations_room
        FOREIGN KEY (room_id) REFERENCES rooms(room_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=InnoDB;



CREATE TABLE payments (
    payment_id      INT AUTO_INCREMENT PRIMARY KEY,
    allocation_id   INT NOT NULL,
    amount          DECIMAL(10,2) NOT NULL,
    payment_date    DATE NOT NULL,
    payment_method  ENUM('Cash','Bank Transfer','Mobile Money','Card') NOT NULL,

    CONSTRAINT fk_payments_allocation
        FOREIGN KEY (allocation_id) REFERENCES allocations(allocation_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;


-- ---------- ROOMS (12 rows) ----------
INSERT INTO rooms (room_number, room_type, floor_number, capacity, monthly_rent) VALUES
('A101', 'Single',    1, 1, 450.00),
('A102', 'Double',    1, 2, 320.00),
('A103', 'Double',    1, 2, 320.00),
('A104', 'Triple',    1, 3, 260.00),
('B201', 'Single',    2, 1, 450.00),
('B202', 'Double',    2, 2, 320.00),
('B203', 'Triple',    2, 3, 260.00),
('B204', 'Dormitory', 2, 6, 180.00),
('C301', 'Single',    3, 1, 450.00),
('C302', 'Double',    3, 2, 320.00),
('C303', 'Triple',    3, 3, 260.00),
('C304', 'Dormitory', 3, 8, 160.00);

-- ---------- STUDENTS (12 rows) ----------
INSERT INTO students (reg_number, first_name, last_name, gender, date_of_birth, phone, email, department, year_of_study) VALUES
('REG2023001', 'Ama',      'Owusu',    'Female', '2003-04-12', '0244000001', 'ama.owusu@uni.edu',     'Computer Science',        2),
('REG2023002', 'Kwame',    'Mensah',   'Male',   '2002-11-03', '0244000002', 'kwame.mensah@uni.edu',  'Electrical Engineering',  3),
('REG2023003', 'Efua',     'Asante',   'Female', '2004-01-20', '0244000003', 'efua.asante@uni.edu',   'Nursing',                 1),
('REG2023004', 'Kofi',     'Boateng',  'Male',   '2003-07-09', '0244000004', 'kofi.boateng@uni.edu',  'Business Administration', 2),
('REG2023005', 'Akosua',   'Darko',    'Female', '2002-09-15', '0244000005', 'akosua.darko@uni.edu',  'Computer Science',        3),
('REG2023006', 'Yaw',      'Appiah',   'Male',   '2004-03-01', '0244000006', 'yaw.appiah@uni.edu',    'Civil Engineering',       1),
('REG2023007', 'Abena',    'Frimpong', 'Female', '2003-12-22', '0244000007', 'abena.frimpong@uni.edu','Law',                     2),
('REG2023008', 'Kwabena',  'Osei',     'Male',   '2002-05-30', '0244000008', 'kwabena.osei@uni.edu',  'Medicine',                4),
('REG2023009', 'Adwoa',    'Sarpong',  'Female', '2004-06-18', '0244000009', 'adwoa.sarpong@uni.edu', 'Accounting',              1),
('REG2023010', 'Kojo',     'Antwi',    'Male',   '2003-02-14', '0244000010', 'kojo.antwi@uni.edu',    'Computer Science',        2),
('REG2023011', 'Esi',      'Amponsah', 'Female', '2002-10-07', '0244000011', 'esi.amponsah@uni.edu',  'Pharmacy',                3),
('REG2023012', 'Kwesi',    'Adjei',    'Male',   '2004-08-25', '0244000012', 'kwesi.adjei@uni.edu',   'Economics',               1);


INSERT INTO allocations (student_id, room_id, allocation_date, vacate_date, status) VALUES
(1,  2,  '2024-09-01', NULL,         'Active'),
(2,  5,  '2024-09-01', NULL,         'Active'),
(3,  6,  '2024-09-02', NULL,         'Active'),
(4,  4,  '2024-09-02', NULL,         'Active'),
(5,  9,  '2024-09-03', NULL,         'Active'),
(6,  7,  '2024-09-03', NULL,         'Active'),
(7,  1,  '2024-09-04', NULL,         'Active'),
(8,  10, '2024-09-04', NULL,         'Active'),
(9,  8,  '2024-09-05', NULL,         'Active'),
(10, 2,  '2024-09-05', NULL,         'Active'),
(11, 12, '2024-09-06', NULL,         'Active'),
(12, 3,  '2023-09-10', '2024-06-30', 'Vacated');



INSERT INTO payments (allocation_id, amount, payment_date, payment_method) VALUES
(1,  320.00, '2024-09-05', 'Mobile Money'),
(1,  320.00, '2024-10-05', 'Mobile Money'),
(2,  450.00, '2024-09-06', 'Bank Transfer'),
(3,  320.00, '2024-09-07', 'Cash'),
(4,  260.00, '2024-09-07', 'Mobile Money'),
(5,  450.00, '2024-09-08', 'Card'),
(5,  450.00, '2024-10-08', 'Card'),
(6,  260.00, '2024-09-09', 'Cash'),
(7,  450.00, '2024-09-10', 'Bank Transfer'),
(9,  180.00, '2024-09-12', 'Mobile Money'),
(10, 320.00, '2024-09-12', 'Mobile Money'),
(11, 160.00, '2024-09-13', 'Cash'),
(12, 320.00, '2023-09-15', 'Cash'),
(12, 320.00, '2023-10-15', 'Cash');


SELECT
    s.reg_number,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    r.room_number,
    r.room_type,
    a.allocation_date
FROM allocations a
JOIN students s ON s.student_id = a.student_id
JOIN rooms    r ON r.room_id    = a.room_id
WHERE a.status = 'Active'
ORDER BY r.room_number;

----Occupancy count and potential monthly revenue per room type.----
SELECT
    r.room_type,
    COUNT(a.allocation_id) AS students_housed,
    SUM(r.monthly_rent)    AS monthly_revenue
FROM rooms r
LEFT JOIN allocations a
       ON a.room_id = r.room_id AND a.status = 'Active'
GROUP BY r.room_type
ORDER BY monthly_revenue DESC;

--Aggregate + HAVING: Total amount paid by each currently active student,
--     showing only those who have paid more than 300 in total.
SELECT
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    COUNT(p.payment_id)  AS number_of_payments,
    SUM(p.amount)        AS total_paid
FROM students s
JOIN allocations a ON a.student_id = s.student_id
JOIN payments p    ON p.allocation_id = a.allocation_id
GROUP BY s.student_id, student_name
HAVING SUM(p.amount) > 300
ORDER BY total_paid DESC;

-- Q4. Subquery: Rooms that still have free capacity (not fully occupied).
SELECT *
FROM (
    SELECT
        r.room_number,
        r.room_type,
        r.capacity,
        (SELECT COUNT(*) FROM allocations a
          WHERE a.room_id = r.room_id AND a.status = 'Active') AS occupants,
        r.capacity - (SELECT COUNT(*) FROM allocations a
                       WHERE a.room_id = r.room_id AND a.status = 'Active') AS free_slots
    FROM rooms r
) AS room_occupancy
WHERE free_slots > 0
ORDER BY free_slots DESC;


SELECT
    s.reg_number,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    r.room_number,
    a.allocation_date
FROM allocations a
JOIN students s ON s.student_id = a.student_id
JOIN rooms    r ON r.room_id    = a.room_id
LEFT JOIN payments p ON p.allocation_id = a.allocation_id
WHERE a.status = 'Active' AND p.payment_id IS NULL;
