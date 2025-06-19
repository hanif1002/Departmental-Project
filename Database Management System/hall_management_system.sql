-- Drop existing tables
DROP TABLE meal_schedule CASCADE CONSTRAINTS;
DROP TABLE rooms CASCADE CONSTRAINTS;
DROP TABLE staff CASCADE CONSTRAINTS;
DROP TABLE student CASCADE CONSTRAINTS;
DROP TABLE hall CASCADE CONSTRAINTS;
DROP TABLE payment_details CASCADE CONSTRAINTS;

-- Create tables
CREATE TABLE hall (
    Hall_ID NUMBER PRIMARY KEY,
    Hall_Name VARCHAR2(100) NOT NULL,
    Capacity NUMBER(3),
    Location VARCHAR2(100) NOT NULL
);

CREATE TABLE student (
    Student_ID NUMBER PRIMARY KEY,
    Full_Name VARCHAR2(100) NOT NULL,
    Email VARCHAR2(100) UNIQUE NOT NULL,
    DOB DATE,
    Department VARCHAR2(50),
    Enrollment_Year NUMBER NOT NULL,
    Hall_ID NUMBER,
    FOREIGN KEY (Hall_ID) REFERENCES hall(Hall_ID) ON DELETE SET NULL -- Set Hall_ID to NULL if Hall is deleted
);

CREATE TABLE staff (
    Staff_ID NUMBER PRIMARY KEY,
    Full_Name VARCHAR2(100) NOT NULL,
    Email VARCHAR2(100) UNIQUE NOT NULL,
    Position VARCHAR2(100) NOT NULL,
    Hall_ID NUMBER,
    FOREIGN KEY (Hall_ID) REFERENCES hall(Hall_ID) ON DELETE SET NULL -- Set Hall_ID to NULL if Hall is deleted
);

CREATE TABLE rooms (
    Room_ID NUMBER PRIMARY KEY,
    Room_Number VARCHAR2(20) NOT NULL,
    Capacity NUMBER NOT NULL CHECK (Capacity > 0),
    Occupant_ID NUMBER,
    Hall_ID NUMBER NOT NULL,
    FOREIGN KEY (Occupant_ID) REFERENCES student(Student_ID) ON DELETE SET NULL, -- Set Occupant_ID to NULL if Student is deleted
    FOREIGN KEY (Hall_ID) REFERENCES hall(Hall_ID) ON DELETE CASCADE -- Delete Room if Hall is deleted
);

CREATE TABLE meal_schedule (
    Schedule_ID NUMBER PRIMARY KEY,
    Hall_ID NUMBER NOT NULL,
    Meal_Date DATE NOT NULL,
    Meal_Time VARCHAR2(20) NOT NULL,
    Menu_Item VARCHAR2(200) NOT NULL,
    FOREIGN KEY (Hall_ID) REFERENCES hall(Hall_ID) ON DELETE CASCADE -- Delete Meal Schedule if Hall is deleted
);

-- Create Payment Details Table
CREATE TABLE payment_details (
    Payment_ID NUMBER PRIMARY KEY,            
    Student_ID NUMBER,                        
    Total_Amount NUMBER NOT NULL CHECK (Total_Amount >= 0),  
    Refund NUMBER DEFAULT 0 CHECK (Refund >= 0),  
    Net_Payment NUMBER NOT NULL CHECK (Net_Payment >= 0),   
    Receipt_SL VARCHAR2(50) UNIQUE NOT NULL,   
    Paid_Date DATE NOT NULL,                  
    FOREIGN KEY (Student_ID) REFERENCES student(Student_ID) ON DELETE CASCADE -- Delete Payment record if Student is deleted
);
insert into hall (hall_id, hall_name, capacity, location)
values (1, 'Bangabandhu  Hall', 600, 'Beside KUET Academic Building');

insert into hall (hall_id, hall_name, capacity, location)
values (2, 'Khaja Hall', 500, 'Beside KUET Shahid Minar');

insert into hall (hall_id, hall_name, capacity, location)
values (3, 'Lalon shah Hall', 400, 'Beside KUET Central Mosque');

insert into hall (hall_id, hall_name, capacity, location)
values (4, 'Rokeya Hall', 800, 'Beside KUET Administration Building');

insert into hall (hall_id, hall_name, capacity, location)
values (5, 'Dr. M A Rashid Hall', 300, 'Beside KUET Cafeteria');

insert into hall (hall_id, hall_name, capacity, location)
values (6, 'Amar Ekushey Hall', 500, 'In front of KUET Administration Building (D block)');

select *  from hall;




INSERT INTO student (student_id, full_name, email, dob, department, enrollment_year, hall_id)
VALUES (2009001, 'Showmitro Bishwash', 'showmitro1@gmail.com', TO_DATE('2002-01-03', 'yyyy-mm-dd'), 'ECE', 2022, 2);

INSERT INTO student (student_id, full_name, email, dob, department, enrollment_year, hall_id)
VALUES (2009054, 'Md. Abu Hanif Khan', 'khan2009054@gmail.com', TO_DATE('2002-10-10', 'yyyy-mm-dd'), 'ECE', 2022, 1);

INSERT INTO student (student_id, full_name, email, dob, department, enrollment_year, hall_id)
VALUES (2007062, 'Swapnil Kundu Argha', 'swapnilkundu01@gmail.com', TO_DATE('2003-01-16', 'yyyy-mm-dd'), 'CSE', 2022, 1);

INSERT INTO student (student_id, full_name, email, dob, department, enrollment_year, hall_id)
VALUES (2007087, 'Sifat', 'sifat64@gmail.com', TO_DATE('2002-11-17', 'yyyy-mm-dd'), 'CSE', 2022, 3);

INSERT INTO student (student_id, full_name, email, dob, department, enrollment_year, hall_id)
VALUES (2001039, 'Yusuf Al Naim', 'naimcivil@gmail.com', TO_DATE('2002-11-20', 'yyyy-mm-dd'), 'Civil Engineering', 2022, 1);

INSERT INTO student (student_id, full_name, email, dob, department, enrollment_year, hall_id)
VALUES (2003095, 'Tamim ', 'tamim67@gmail.com', TO_DATE('2001-02-20', 'yyyy-mm-dd'), 'EEE', 2023, 2);

INSERT INTO student (student_id, full_name, email, dob, department, enrollment_year, hall_id)
VALUES (2003119, 'Sakibul Hoque', 'sakibul867@gmail.com', TO_DATE('2002-08-12', 'yyyy-mm-dd'), 'EEE', 2019, 3);

INSERT INTO student (student_id, full_name, email, dob, department, enrollment_year, hall_id)
VALUES (2009056, 'Anika', 'anika12@example.com', TO_DATE('2002-02-03', 'yyyy-mm-dd'), 'ECE', 2021, 4);

INSERT INTO student (student_id, full_name, email, dob, department, enrollment_year, hall_id)
VALUES (2009018, 'Aurpa', 'aurpa118@example.com', TO_DATE('2002-12-07', 'yyyy-mm-dd'), 'ECE', 2022, 4);
INSERT INTO student (student_id, full_name, email, dob, department, enrollment_year, hall_id)
VALUES (2009060, 'Akramuddoula', 'bappi18@example.com', TO_DATE('2002-02-17', 'yyyy-mm-dd'), 'ECE', 2022, 1);

INSERT INTO student (student_id, full_name, email, dob, department, enrollment_year, hall_id)
VALUES (2003087, 'Asif Rahman', 'asif67@gmail.com', TO_DATE('2001-04-03', 'yyyy-mm-dd'), 'EEE', 2023, 5);
select * from student;


INSERT INTO staff (staff_id, full_name, email, position, hall_id)
VALUES (1, 'Krishna Chandra Biswas', 'Krishnachandra@gmail.com', 'Hall Section Officer', 1);

INSERT INTO staff (staff_id, full_name, email, position, hall_id)
VALUES (2, 'Sultan Ali', 'sultanAli@yahoo.com', 'Hall Director', 2);

INSERT INTO staff (staff_id, full_name, email, position, hall_id)
VALUES (3, 'Mofiz Uddin', 'MofizUddin@example.com', 'Maintenance Supervisor', 3);

INSERT INTO staff (staff_id, full_name, email, position, hall_id)
VALUES (4, 'Shanhina Sabnam', 'sabanm123@example.com', 'Section Officer', 4);

INSERT INTO staff (staff_id, full_name, email, position, hall_id)
VALUES (5, 'Hasan Abdullah', 'hasan123@example.com', 'Section Officer', 5);
INSERT INTO staff (staff_id, full_name, email, position, hall_id)
VALUES (6, 'Rakibul Islam', 'rakibul@gmail.com', 'Security Officer', 1);

INSERT INTO staff (staff_id, full_name, email, position, hall_id)
VALUES (7, 'Nabila Sultana', 'nabila.sultana@gmail.com', 'Accountant', 1);

INSERT INTO staff (staff_id, full_name, email, position, hall_id)
VALUES (8, 'Rasheda Begum', 'rasheda.begum@yahoo.com', 'Dining Hall Manager', 2);

INSERT INTO staff (staff_id, full_name, email, position, hall_id)
VALUES (9, 'Jahangir Alam', 'jahangir.alam@yahoo.com', 'Cleaner', 2);

INSERT INTO staff (staff_id, full_name, email, position, hall_id)
VALUES (10, 'Nazmul Hasan', 'nazmul.hasan@example.com', 'Security Officer', 3);

select * from staff;


-- Rooms

INSERT INTO rooms (room_id, room_number, capacity, occupant_id, hall_id)
VALUES (1, '211', 2, 2007062, 1);

INSERT INTO rooms (room_id, room_number, capacity, occupant_id, hall_id)
VALUES (2, '102', 2, 2009001, 2);

INSERT INTO rooms (room_id, room_number, capacity, occupant_id, hall_id)
VALUES (3, '206', 2, 2009054, 1);

INSERT INTO rooms (room_id, room_number, capacity, occupant_id, hall_id)
VALUES (4, '409', 2, 2007087, 1);

INSERT INTO rooms (room_id, room_number, capacity, occupant_id, hall_id)
VALUES (5, '103', 3, 2009060, 2);

INSERT INTO rooms (room_id, room_number, capacity, occupant_id, hall_id)
VALUES (6, '102', 3, 2001039, 1);

INSERT INTO rooms (room_id, room_number, capacity, occupant_id, hall_id)
VALUES (7, '102', 3, 2003119, 3);

INSERT INTO rooms (room_id, room_number, capacity, occupant_id, hall_id)
VALUES (8, '102', 3, 2009056, 4);

INSERT INTO rooms (room_id, room_number, capacity, occupant_id, hall_id)
VALUES (9, '103', 3, 2003087, 5);

INSERT INTO rooms (room_id, room_number, capacity, occupant_id, hall_id)
VALUES (10, '101', 2, 2009018, 4);

select * from rooms;





-- Meal Schedule for Hall 1
INSERT INTO meal_schedule (schedule_id, hall_id, meal_date, meal_time, menu_item)
VALUES (1001, 1, TO_DATE('2024-11-18', 'yyyy-mm-dd'), '12:00 PM', 'Rice and Dal');

INSERT INTO meal_schedule (schedule_id, hall_id, meal_date, meal_time, menu_item)
VALUES (1002, 1, TO_DATE('2024-11-19', 'yyyy-mm-dd'), '12:00 PM', 'Vegetable Curry');

INSERT INTO meal_schedule (schedule_id, hall_id, meal_date, meal_time, menu_item)
VALUES (1003, 1, TO_DATE('2024-11-20', 'yyyy-mm-dd'), '12:00 PM', 'Fried Rice');

-- Meal Schedule for Hall 2
INSERT INTO meal_schedule (schedule_id, hall_id, meal_date, meal_time, menu_item)
VALUES (2001, 2, TO_DATE('2024-11-18', 'yyyy-mm-dd'), '6:00 PM', 'Mixed Salad');

INSERT INTO meal_schedule (schedule_id, hall_id, meal_date, meal_time, menu_item)
VALUES (2002, 2, TO_DATE('2024-11-19', 'yyyy-mm-dd'), '6:00 PM', 'Chicken Stew');

INSERT INTO meal_schedule (schedule_id, hall_id, meal_date, meal_time, menu_item)
VALUES (2003, 2, TO_DATE('2024-11-20', 'yyyy-mm-dd'), '6:00 PM', 'Grilled Chicken');

-- Meal Schedule for Hall 3
INSERT INTO meal_schedule (schedule_id, hall_id, meal_date, meal_time, menu_item)
VALUES (3001, 3, TO_DATE('2024-11-18', 'yyyy-mm-dd'), '7:30 AM', 'Toast with Butter');

INSERT INTO meal_schedule (schedule_id, hall_id, meal_date, meal_time, menu_item)
VALUES (3002, 3, TO_DATE('2024-11-19', 'yyyy-mm-dd'), '7:30 AM', 'Omelette');

INSERT INTO meal_schedule (schedule_id, hall_id, meal_date, meal_time, menu_item)
VALUES (3003, 3, TO_DATE('2024-11-20', 'yyyy-mm-dd'), '7:30 AM', 'Pancakes');

-- Meal Schedule for Hall 4
INSERT INTO meal_schedule (schedule_id, hall_id, meal_date, meal_time, menu_item)
VALUES (4001, 4, TO_DATE('2024-11-18', 'yyyy-mm-dd'), '1:00 PM', 'Vegetable Pulao');

INSERT INTO meal_schedule (schedule_id, hall_id, meal_date, meal_time, menu_item)
VALUES (4002, 4, TO_DATE('2024-11-19', 'yyyy-mm-dd'), '1:00 PM', 'Simple Veg Curry');

INSERT INTO meal_schedule (schedule_id, hall_id, meal_date, meal_time, menu_item)
VALUES (4003, 4, TO_DATE('2024-11-20', 'yyyy-mm-dd'), '1:00 PM', 'Mashed Potatoes with Gravy');

-- Meal Schedule for Hall 5
INSERT INTO meal_schedule (schedule_id, hall_id, meal_date, meal_time, menu_item)
VALUES (5001, 5, TO_DATE('2024-11-18', 'yyyy-mm-dd'), '12:00 PM', 'Fried Noodles');

INSERT INTO meal_schedule (schedule_id, hall_id, meal_date, meal_time, menu_item)
VALUES (5002, 5, TO_DATE('2024-11-19', 'yyyy-mm-dd'), '12:00 PM', 'Vegetable Soup');

INSERT INTO meal_schedule (schedule_id, hall_id, meal_date, meal_time, menu_item)
VALUES (5003, 5, TO_DATE('2024-11-20', 'yyyy-mm-dd'), '12:00 PM', 'Boiled Eggs with Rice');

-- Meal Schedule for Hall 6
INSERT INTO meal_schedule (schedule_id, hall_id, meal_date, meal_time, menu_item)
VALUES (6001, 6, TO_DATE('2024-11-18', 'yyyy-mm-dd'), '6:00 PM', 'Veg Fried Rice');

INSERT INTO meal_schedule (schedule_id, hall_id, meal_date, meal_time, menu_item)
VALUES (6002, 6, TO_DATE('2024-11-19', 'yyyy-mm-dd'), '6:00 PM', 'Egg Curry');

INSERT INTO meal_schedule (schedule_id, hall_id, meal_date, meal_time, menu_item)
VALUES (6003, 6, TO_DATE('2024-11-20', 'yyyy-mm-dd'), '6:00 PM', 'Simple Chicken Curry');

select * from meal_schedule;



INSERT INTO payment_details (payment_id, student_id, total_amount, refund, net_payment, receipt_sl, paid_date)
VALUES (1, 2009001, 5000, 0, 5000, 'R001', TO_DATE('2024-05-10', 'yyyy-mm-dd'));

INSERT INTO payment_details (payment_id, student_id, total_amount, refund, net_payment, receipt_sl, paid_date)
VALUES (2, 2009054, 4500, 0, 4500, 'R002', TO_DATE('2024-05-12', 'yyyy-mm-dd'));

INSERT INTO payment_details (payment_id, student_id, total_amount, refund, net_payment, receipt_sl, paid_date)
VALUES (3, 2007062, 4800, 0, 4800, 'R003', TO_DATE('2024-05-14', 'yyyy-mm-dd'));

INSERT INTO payment_details (payment_id, student_id, total_amount, refund, net_payment, receipt_sl, paid_date)
VALUES (4, 2007087, 4900, 0, 4900, 'R004', TO_DATE('2024-05-15', 'yyyy-mm-dd'));

INSERT INTO payment_details (payment_id, student_id, total_amount, refund, net_payment, receipt_sl, paid_date)
VALUES (5, 2001039, 5100, 0, 5100, 'R005', TO_DATE('2024-05-16', 'yyyy-mm-dd'));

INSERT INTO payment_details (payment_id, student_id, total_amount, refund, net_payment, receipt_sl, paid_date)
VALUES (6, 2003095, 5200, 0, 5200, 'R006', TO_DATE('2024-05-17', 'yyyy-mm-dd'));

INSERT INTO payment_details (payment_id, student_id, total_amount, refund, net_payment, receipt_sl, paid_date)
VALUES (7, 2003119, 5500, 0, 5500, 'R007', TO_DATE('2024-05-18', 'yyyy-mm-dd'));

INSERT INTO payment_details (payment_id, student_id, total_amount, refund, net_payment, receipt_sl, paid_date)
VALUES (8, 2009056, 5400, 0, 5400, 'R008', TO_DATE('2024-05-19', 'yyyy-mm-dd'));

INSERT INTO payment_details (payment_id, student_id, total_amount, refund, net_payment, receipt_sl, paid_date)
VALUES (9, 2009018, 4600, 0, 4600, 'R009', TO_DATE('2024-05-20', 'yyyy-mm-dd'));

INSERT INTO payment_details (payment_id, student_id, total_amount, refund, net_payment, receipt_sl, paid_date)
VALUES (10, 2003087, 5300, 0, 5300, 'R010', TO_DATE('2024-05-21', 'yyyy-mm-dd'));

SELECT * FROM payment_details;


--description of each table

    desc hall;
    desc student;
    desc staff;
    desc rooms;
    desc meal_schedule;
    desc payment_details;


--data according each table
    select *  from hall;
    select *  from student;
    select *  from staff;
    select *  from rooms;
    select *  from meal_schedule;
    select *  from payment_details;


--add a column named phone_number of type varchar2(20) to the student table
alter table student add phone_number varchar2(20);


--rename the column email to student_email in the student table
alter table student rename column email TO student_email;


-- modify the data type of the column capacity to number(5) in the hall tableDELETE FROM hall WHERE LENGTH(TO_CHAR(capacity)) > 5;
CREATE TABLE hall_backup AS SELECT * FROM hall;
UPDATE hall SET capacity = NULL;
ALTER TABLE hall MODIFY capacity NUMBER(5);
UPDATE hall h
SET h.capacity = (SELECT b.capacity FROM hall_backup b WHERE h.Hall_ID = b.Hall_ID);


--drop the column occupant_id from the rooms table
alter table rooms drop column occupant_id;


--Update Data in a Table
update student set department = 'Electronics and Communication Engineering' where student_id = 2009054;

-- Delete the record of a student 
DELETE FROM student
WHERE Student_ID = 2009001;


----set operation and sub query------------------------------------------------------

-- Retrieve student information for those assigned to Hall 'H01'
SELECT Full_Name, Student_ID
FROM student
WHERE  Student_ID IN (
    -- Subquery: Get roll numbers of students assigned to Hall 'H01'
    SELECT occupant_id
    FROM Rooms
    WHERE hall_id = '1'
);


-- Get all students and staff in Hall '1', including duplicates
SELECT Full_Name, Student_ID
FROM student
WHERE hall_id = '1'
UNION ALL
SELECT Full_Name, staff_id
FROM staff
WHERE hall_id = '1';

-- Get unique students and staff in Hall '2'
SELECT  Full_Name, Student_ID
FROM student
WHERE hall_id = '2'
UNION
SELECT  Full_Name, staff_id
FROM staff
WHERE hall_id = '2';

-- Find common students and staff assigned to rooms in Hall '3'
SELECT Full_Name, Student_ID
FROM student
WHERE hall_id = '3'
INTERSECT
SELECT Full_Name, staff_id
FROM staff
WHERE hall_id = '3';

-- Get students from Hall '4' who are not staff
SELECT Full_Name, Student_ID
FROM student
WHERE hall_id = '4'
MINUS
SELECT Full_Name, staff_id
FROM staff
WHERE hall_id = '4';

-- Combine students and staff assigned to Hall '5' who have meal plans
SELECT Full_Name, Student_ID
FROM student
WHERE hall_id = '5'
AND Student_ID IN (SELECT  Student_ID FROM meal_schedule WHERE hall_id = '5')
UNION
(
    -- Subquery: Find staff assigned to Hall '5' who also have meal plans
    SELECT Full_Name, staff_id
    FROM staff
    WHERE hall_id = '5'
    AND staff_id IN (SELECT staff_id FROM meal_schedule WHERE hall_id = '5')
);



------------aggregate function----------------------------

-- Calculate net payment divided by 10 for each record
SELECT payment_id, student_id, net_payment, (net_payment / 10) AS net_payment_divided
FROM payment_details;

-- Fetch payments for students with student IDs 2009001 or 2009054
SELECT * FROM payment_details
WHERE student_id = 2009001 OR student_id = 2009054;

-- Fetch records where net payment is between 5000 and 5500
SELECT * FROM payment_details
WHERE net_payment BETWEEN 5000 AND 5500;

-- Fetch records where the student has a specific net payment (e.g., 5000 or 5100)
SELECT * FROM payment_details
WHERE net_payment IN (5000, 5100);

-- Fetch payments sorted by net payment in ascending order
SELECT * FROM payment_details
ORDER BY net_payment ASC;

-- Fetch payments sorted by net payment in descending order
SELECT * FROM payment_details
ORDER BY net_payment DESC;


-- Count the total number of payments
SELECT COUNT(*) AS total_payments FROM payment_details;

-- Fetch the maximum and minimum net payment amounts
SELECT MAX(net_payment) AS max_payment, MIN(net_payment) AS min_payment FROM payment_details;

-- Get the total payments per student
SELECT student_id, SUM(net_payment) AS total_payment
FROM payment_details
GROUP BY student_id;


-- Fetch students who have paid more than 5000 in total
SELECT student_id, SUM(net_payment) AS total_payment
FROM payment_details
GROUP BY student_id
HAVING SUM(net_payment) > 5000;


SELECT AVG(net_payment) AS average_net_payment
FROM payment_details;




--Inner Join (Standard Join)
SELECT student.student_id, student.full_name, hall.hall_name
FROM student
JOIN hall ON student.hall_id = hall.hall_id;

--Natural Join
SELECT student.student_id, student.full_name, hall.hall_name
FROM student
NATURAL JOIN hall;

--Equi Join
SELECT rooms.room_number, student.student_id, student.full_name
FROM rooms
JOIN student ON rooms.occupant_id = student.student_id;

--Non-Equi Join
SELECT student.student_id, student.full_name, meal_schedule.meal_date
FROM student
JOIN meal_schedule ON student.enrollment_year < EXTRACT(YEAR FROM meal_schedule.meal_date);

-- Self-join to fetch staff members and other staff in the same hall
SELECT 
    s1.Staff_ID AS Staff_ID,
    s1.Full_Name AS Staff_Name,
    s2.Full_Name AS Colleague_Name
FROM 
    staff s1
LEFT JOIN 
    staff s2 
ON 
    s1.Hall_ID = s2.Hall_ID 
    AND s1.Staff_ID != s2.Staff_ID;


SELECT
    student.Student_ID,
    student.Full_Name AS Student_Name,
    hall.Hall_Name AS Assigned_Hall,
    hall.Location AS Hall_Location
FROM
    student
LEFT OUTER JOIN
    hall
ON
    student.Hall_ID = hall.Hall_ID;


SELECT
    hall.Hall_ID,
    hall.Hall_Name,
    student.Student_ID AS Resident_Student_ID,
    student.Full_Name AS Resident_Student_Name
FROM
    hall
RIGHT OUTER JOIN
    student
ON
    student.Hall_ID = hall.Hall_ID; 



--pl sql----

--max capacity of a hall--
DECLARE
    max_capacity NUMBER;
    hall_name VARCHAR2(100);
BEGIN
    SELECT Capacity, Hall_Name
    INTO max_capacity, hall_name
    FROM hall
    WHERE Capacity = (SELECT MAX(Capacity) FROM hall WHERE Capacity IS NOT NULL);

    DBMS_OUTPUT.PUT_LINE('Hall with Maximum Capacity: ' || hall_name || ' (' || max_capacity || ')');
END;
/

---Use a loop and cursor to fetch details of all rooms in a hall.
DECLARE
    CURSOR room_cursor IS
        SELECT Room_ID, Room_Number, Capacity FROM rooms WHERE Hall_ID = 1;
    room_row room_cursor%ROWTYPE;
BEGIN
    OPEN room_cursor;
    LOOP
        FETCH room_cursor INTO room_row;
        EXIT WHEN room_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Room ID: ' || room_row.Room_ID || ', Number: ' || room_row.Room_Number || ', Capacity: ' || room_row.Capacity);
    END LOOP;
    CLOSE room_cursor;
END;
/

--Update a staff member's hall assignment and handle errors.
DECLARE
    staff_id NUMBER := 101;
    new_hall_id NUMBER := 2;
BEGIN
    UPDATE staff
    SET Hall_ID = new_hall_id
    WHERE Staff_ID = staff_id;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No staff member found with the given ID.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Staff hall assignment updated successfully.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/


DECLARE
    student_id NUMBER := 1001;
    refund_amount NUMBER := 100;
BEGIN
    -- Adjust payment before deletion
    UPDATE payment_details
    SET Refund = Refund + refund_amount, Net_Payment = Net_Payment - refund_amount
    WHERE Student_ID = student_id;

    -- Delete student
    DELETE FROM student WHERE Student_ID = student_id;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No student found with the given ID.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Student deleted successfully, and refund processed.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/

--inserts three meal schedules (Breakfast, Lunch, and Dinner) with corresponding menu items for a specific date and automatically increments the meal date for each meal
DECLARE
    meal_date DATE := TO_DATE('19/12/2024', 'DD/MM/YYYY');
    meal_time VARCHAR2(20);
    menu_item VARCHAR2(200);
BEGIN
    FOR i IN 1..3 LOOP
        IF i = 1 THEN
            meal_time := 'Breakfast';
            menu_item := 'Pancakes';
        ELSIF i = 2 THEN
            meal_time := 'Lunch';
            menu_item := 'Grilled Chicken';
        ELSE
            meal_time := 'Dinner';
            menu_item := 'Pasta';
        END IF;

        INSERT INTO meal_schedule (Schedule_ID, Hall_ID, Meal_Date, Meal_Time, Menu_Item)
        VALUES (i, 1, meal_date + i, meal_time, menu_item);  -- Use 'i' for Schedule_ID
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Meal schedule inserted successfully.');
END;
/

CREATE OR REPLACE PROCEDURE add_hall (
    p_hall_id IN NUMBER,
    p_hall_name IN VARCHAR2,
    p_capacity IN NUMBER,
    p_location IN VARCHAR2
) AS
BEGIN
    INSERT INTO hall (hall_id, hall_name, capacity, location)
    VALUES (p_hall_id, p_hall_name, p_capacity, p_location);
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Hall added successfully!');
    
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Error: Duplicate hall ID.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END add_hall;
/
BEGIN
    add_hall(7, 'Main Auditorium', 500, 'Building A');
END;
/
