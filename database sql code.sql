CREATE DATABASE BloodBank;
USE BloodBank;
CREATE TABLE Donor (
    donor_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    contact VARCHAR(20),
    blood_group VARCHAR(5)
);
CREATE TABLE BloodStock (
    blood_group VARCHAR(5) PRIMARY KEY,
    units_available INT
);
CREATE TABLE Donation (
    donation_id INT PRIMARY KEY,
    donor_id INT,
    blood_group VARCHAR(5),
    units INT,
    donation_date DATE,
    FOREIGN KEY (donor_id) REFERENCES Donor(donor_id)
);
CREATE TABLE BloodRequest (
    request_id INT PRIMARY KEY,
    patient_name VARCHAR(50),
    blood_group VARCHAR(5),
    units_requested INT,
    status VARCHAR(20)
);
CREATE TABLE ActionLog (
    action_id INT PRIMARY KEY,
    description VARCHAR(100),
    action_time DATE,
    performed_by VARCHAR(50)
);
INSERT INTO Donor VALUES (1, 'Ali', 25, '03001234567', 'A+');
INSERT INTO Donor VALUES (2, 'Ahmed', 30, '03111234567', 'B+');

INSERT INTO BloodStock VALUES ('A+', 10);
INSERT INTO BloodStock VALUES ('B+', 8);

INSERT INTO Donation VALUES (101, 1, 'A+', 2, '2026-05-05');
INSERT INTO Donation VALUES (102, 2, 'B+', 3, '2026-05-05');

INSERT INTO BloodRequest VALUES (201, 'Hassan', 'A+', 2, 'Pending');

INSERT INTO ActionLog VALUES (301, 'Donation added', '2026-05-05', 'Admin');
SELECT Donor.name, Donation.blood_group, Donation.units
FROM Donor, Donation
WHERE Donor.donor_id = Donation.donor_id;
SELECT name
FROM Donor
WHERE donor_id IN (
    SELECT donor_id FROM Donation
);
SELECT COUNT(*) AS total_donations FROM Donation;
SELECT SUM(units_available) AS total_units FROM BloodStock;
SELECT * FROM Donor
WHERE blood_group = 'A+';
SELECT * FROM Donor;
SELECT * FROM BloodStock;
SELECT * FROM Donation;
SELECT * FROM BloodRequest;