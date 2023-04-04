-- DDL Transactional Statements Script

BEGIN TRANSACTION
CREATE DATABASE voting_system;
COMMIT TRANSACTION

USE voting_system;
GO

BEGIN TRANSACTION

GO

CREATE TABLE candidate (
    candidate_id INT NOT NULL PRIMARY KEY,
    candidate_fName VARCHAR(255) NOT NULL,
    candidate_lName VARCHAR(255) NOT NULL,
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    party_name VARCHAR(255) NOT NULL,
    age INT NOT NULL,
    total_votes INT NOT NULL DEFAULT 0
);

SAVE TRANSACTION save1;

GO

CREATE TABLE voter (
    voter_id INT NOT NULL PRIMARY KEY,
    voter_fName VARCHAR(255) NOT NULL,
    voter_lName VARCHAR(255) NOT NULL,
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    street_address VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    province VARCHAR(255) NOT NULL,
    age INT NOT NULL,
    gender VARCHAR(10) NOT NULL,
    has_voted BIT NOT NULL DEFAULT 0,
    pollingStationId INT NOT NULL,
);

save TRANSACTION save2;

GO

CREATE TABLE pollingStation (
    pollingStationId INT NOT NULL PRIMARY KEY,
    pollingStationName VARCHAR(255) NOT NULL,
    pollingStationAddress VARCHAR(255) NOT NULL,
    pollingStationCity VARCHAR(255) NOT NULL,
    pollingStationProvince VARCHAR(255) NOT NULL
);

save TRANSACTION save3;

GO

CREATE TABLE admin (
    admin_id INT NOT NULL PRIMARY KEY,
    admin_fName VARCHAR(255) NOT NULL,
    admin_lName VARCHAR(255) NOT NULL,
    admin_user_name VARCHAR(255) NOT NULL,
    user_password VARCHAR(255) NOT NULL,
    pollingStationId INT NOT NULL,
);

save TRANSACTION save4;

GO

CREATE TABLE pollOfficer (
    pollOfficer_id INT NOT NULL PRIMARY KEY,
    pollOfficer_fName VARCHAR(255) NOT NULL,
    pollOfficer_lName VARCHAR(255) NOT NULL,
    pollOfficer_user_name VARCHAR(255) NOT NULL,
    user_password VARCHAR(255) NOT NULL,
    pollingStationId INT NOT NULL,
);

save TRANSACTION save5;

Go

CREATE TABLE pollingMachine (
    pollingMachineId INT NOT NULL PRIMARY KEY,
    candidate_id INT NOT NULL,
    pollingStationID INT NOT NULL,
);

save TRANSACTION save6;
COMMIT TRANSACTION

BEGIN TRANSACTION
GO

ALTER TABLE voter ADD FOREIGN KEY (pollingStationId) REFERENCES pollingStation(pollingStationId);
SAVE TRANSACTION save7;
ALTER TABLE admin ADD FOREIGN KEY (pollingStationId) REFERENCES pollingStation(pollingStationId);
SAVE TRANSACTION save8;
ALTER TABLE pollOfficer ADD FOREIGN KEY (pollingStationId) REFERENCES pollingStation(pollingStationId);
SAVE TRANSACTION save9;
ALTER TABLE pollingMachine ADD FOREIGN KEY (pollingStationId) REFERENCES pollingStation(pollingStationId);
SAVE TRANSACTION save10;
ALTER TABLE pollingMachine ADD FOREIGN KEY (candidate_id) REFERENCES candidate(candidate_id);
SAVE TRANSACTION save11;

COMMIT TRANSACTION

BEGIN TRANSACTION
GO

INSERT INTO pollingStation (pollingStationId, pollingStationName, pollingStationAddress, pollingStationCity, pollingStationProvince)
VALUES 
    (1, 'Halifax Central Library', '5440 Spring Garden Road', 'Halifax', 'Nova Scotia'),
    (2, 'Scotiabank Centre', '1800 Argyle Street', 'Halifax', 'Nova Scotia'),
    (3, 'Dartmouth Sportsplex', '110 Wyse Road', 'Dartmouth', 'Nova Scotia'),
    (4, 'Alderney Landing', '2 Ochterloney Street', 'Dartmouth', 'Nova Scotia'),
    (5, 'Sackville Sports Stadium', '409 Glendale Drive', 'Lower Sackville', 'Nova Scotia');

SAVE TRANSACTION save12;

GO

INSERT INTO admin (admin_id, admin_fName, admin_lName, admin_user_name, user_password, pollingStationId)
VALUES
    (1, 'Jennifer', 'Smith', 'j.smith', 'password123', 1),
    (2, 'Michael', 'Jones', 'm.jones', 'letmein', 2),
    (3, 'Sarah', 'Wilson', 's.wilson', 'hello123', 3),
    (4, 'David', 'Brown', 'd.brown', 'abc123', 4),
    (5, 'Emily', 'Taylor', 'e.taylor', 'qwerty', 5);

SAVE TRANSACTION save13;

GO

INSERT INTO pollOfficer (pollOfficer_id, pollOfficer_fName, pollOfficer_lName, pollOfficer_user_name, user_password, pollingStationId)
VALUES
    (1, 'Mike', 'Johnson', 'mJohnson', 'hello123', 2);
SAVE TRANSACTION save14;

GO
-- Candidates
INSERT INTO candidate (candidate_id, candidate_fName, candidate_lName, phone, email, party_name, age, total_votes)
VALUES 
    (1, 'John', 'Smith', '902-111-1111', 'john.smith@example.com', 'Conservative', 45, 345),
    (2, 'Emily', 'Johnson', '902-222-2222', 'emily.johnson@example.com', 'Liberal', 35, 678),
    (3, 'Michael', 'Williams', '902-333-3333', 'michael.williams@example.com', 'Green Party', 42, 546),
    (4, 'Jessica', 'Brown', '902-444-4444', 'jessica.brown@example.com', 'NDP', 29, 345),
    (5, 'Christopher', 'Garcia', '902-555-5555', 'christopher.garcia@example.com', 'Conservative', 51, 5678),
    (6, 'Ava', 'Martinez', '902-666-6666', 'ava.martinez@example.com', 'Liberal', 38, 456),
    (7, 'David', 'Jackson', '902-777-7777', 'david.jackson@example.com', 'Green Party', 47, 234),
    (8, 'Sophia', 'Lee', '902-888-8888', 'sophia.lee@example.com', 'NDP', 26, 6788),
    (9, 'Daniel', 'Parker', '902-999-9999', 'daniel.parker@example.com', 'Conservative', 43, 45),
    (10, 'Madison', 'Taylor', '902-101-0101', 'madison.taylor@example.com', 'Liberal', 33, 2345),
    (11, 'William', 'Moore', '902-202-0202', 'william.moore@example.com', 'Green Party', 39, 845),
    (12, 'Isabella', 'White', '902-303-0303', 'isabella.white@example.com', 'NDP', 30, 475),
    (13, 'Matthew', 'Allen', '902-404-0404', 'matthew.allen@example.com', 'Conservative', 48, 478),
    (14, 'Olivia', 'Young', '902-505-0505', 'olivia.young@example.com', 'Liberal', 37, 234),
    (15, 'Ethan', 'King', '902-606-0606', 'ethan.king@example.com', 'Green Party', 44, 23);

SAVE TRANSACTION save15;

-- Insert voters
GO

INSERT INTO voter (voter_id, voter_fName, voter_lName, phone, email, street_address, city, province, age, gender, has_voted, pollingStationId)
VALUES
    (1, 'John', 'Smith', '902-123-4567', 'johnsmith@gmail.com', '123 Main St', 'Halifax', 'Nova Scotia', 35, 'Male', 0, 1),
    (2, 'Sarah', 'Johnson', '902-234-5678', 'sarahj@gmail.com', '456 South St', 'Dartmouth', 'Nova Scotia', 28, 'Female', 0, 1),
    (3, 'Michael', 'Brown', '902-345-6789', 'michaelbrown@gmail.com', '789 North St', 'Bedford', 'Nova Scotia', 45, 'Male', 0, 1),
    (4, 'Emily', 'Wilson', '902-456-7890', 'emilywilson@gmail.com', '1010 Spring Ave', 'Halifax', 'Nova Scotia', 29, 'Female', 0, 2),
    (5, 'William', 'Jones', '902-567-8901', 'williamjones@gmail.com', '111 Queen St', 'Dartmouth', 'Nova Scotia', 33, 'Male', 0, 2),
    (6, 'Olivia', 'Davis', '902-678-9012', 'oliviadavis@gmail.com', '1212 King St', 'Bedford', 'Nova Scotia', 24, 'Female', 0, 2),
    (7, 'David', 'Martin', '902-789-0123', 'davidmartin@gmail.com', '1313 South Park St', 'Halifax', 'Nova Scotia', 48, 'Male', 0, 3),
    (8, 'Emma', 'Anderson', '902-890-1234', 'emmaanderson@gmail.com', '1414 Barrington St', 'Dartmouth', 'Nova Scotia', 27, 'Female', 0, 3),
    (9, 'Joseph', 'Taylor', '902-901-2345', 'josephtaylor@gmail.com', '1515 Robie St', 'Bedford', 'Nova Scotia', 41, 'Male', 0, 3),
    (10, 'Sophia', 'Clark', '902-012-3456', 'sophiaclark@gmail.com', '1616 Oxford St', 'Halifax', 'Nova Scotia', 30, 'Female', 0, 4),
    (11, 'Christopher', 'White', '902-123-4567', 'christopherwhite@gmail.com', '1717 Quinpool Rd', 'Dartmouth', 'Nova Scotia', 39, 'Male', 0, 4),
    (12, 'Isabella', 'Hall', '902-234-5678', 'isabellahall@gmail.com', '1818 Herring Cove Rd', 'Bedford', 'Nova Scotia', 25, 'Female', 0, 4),
    (13, 'Ryan', 'Baker', '902-345-6789', 'ryanbaker@gmail.com', '1919 Windsor St', 'Halifax', 'Nova Scotia', 32, 'Male', 0, 5),
    (14, 'Liam', 'MacDonald', '902-123-4567', 'liam.macdonald@gmail.com', '23 Forest Hill Rd', 'Halifax', 'Nova Scotia', 35, 'Male', 0, 3),
    (15, 'Olivia', 'Mackenzie', '902-234-5678', 'olivia.mackenzie@gmail.com', '1405 South Park St', 'Halifax', 'Nova Scotia', 23, 'Female', 0, 3),
    (16, 'Ethan', 'Baker', '902-345-6789', 'ethan.baker@gmail.com', '4011 Robie St', 'Halifax', 'Nova Scotia', 28, 'Male', 0, 3),
    (17, 'Avery', 'Fraser', '902-456-7890', 'avery.fraser@gmail.com', '3126 Joseph Howe Dr', 'Halifax', 'Nova Scotia', 46, 'Female', 0, 3),
    (18, 'Mason', 'Hamilton', '902-567-8901', 'mason.hamilton@gmail.com', '6020 Young St', 'Halifax', 'Nova Scotia', 32, 'Male', 0, 3),
    (19, 'Charlotte', 'Jones', '902-678-9012', 'charlotte.jones@gmail.com', '5232 Morris St', 'Halifax', 'Nova Scotia', 20, 'Female', 0, 4),
    (20, 'Liam', 'Baker', '902-789-0123', 'liam.baker@gmail.com', '1666 Oxford St', 'Halifax', 'Nova Scotia', 29, 'Male', 0, 4),
    (21, 'Isabella', 'MacDonald', '902-890-1234', 'isabella.macdonald@gmail.com', '5010 St Margarets Bay Rd', 'Halifax', 'Nova Scotia', 39, 'Female', 0, 4),
    (22, 'Benjamin', 'Morrison', '902-901-2345', 'benjamin.morrison@gmail.com', '45 Titus St', 'Halifax', 'Nova Scotia', 42, 'Male', 0, 4),
    (23, 'Sophia', 'Fleming', '902-012-3456', 'sophia.fleming@gmail.com', '3185 Oxford St', 'Halifax', 'Nova Scotia', 26, 'Female', 0, 4),
    (24, 'William', 'Jones', '902-123-4567', 'william.jones@gmail.com', '3707 Windsor St', 'Halifax', 'Nova Scotia', 56, 'Male', 0, 5),
    (25, 'Johnny', 'Henderson', '902-554-3234', 'johnny.henderson@gmail.com', '2456 Chebucto Road', 'Halifax', 'Nova Scotia', 24, 'Male', 0, 1);

SAVE TRANSACTION save16;

GO

INSERT INTO pollingMachine (pollingMachineId, candidate_id, pollingStationID)
VALUES (1, 1, 1),
       (2, 2, 1),
       (3, 3, 2),
       (4, 4, 2),
       (5, 5, 3),
       (6, 6, 3),
       (7, 7, 4),
       (8, 8, 4),
       (9, 9, 5),
       (10, 10, 5);

SAVE TRANSACTION save17;

COMMIT TRANSACTION;



-- To register a new candidate:

INSERT INTO candidate (candidate_id, candidate_fName, candidate_lName, phone, email, party_name, age)
VALUES (40, 'John', 'Doe', '1234567890', 'johndoe@email.com', 'Independent', 35);

-- To update candidate information:

UPDATE candidate
SET candidate_fName = 'Tommy', candidate_lName = 'Murphy', age = 38
WHERE candidate_id = 1;

-- To register a new voter:

INSERT INTO voter (voter_id, voter_fName, voter_lName, phone, email, street_address, city, province, age, gender, pollingStationId)
VALUES (56, 'Alice', 'Smith', '0987654321', 'alice@email.com', '123 Main St', 'Toronto', 'Ontario', 25, 'Female', 1);

-- To update voter information:

UPDATE voter
SET voter_fName = 'Bob', voter_lName = 'Smith', age = 30
WHERE voter_id = 1;


-- To update login credentials for a user:

UPDATE admin
SET user_password = 'newpassword'
WHERE admin_user_name = 'e.taylor';

-- to update pollOfficer

UPDATE pollOfficer
SET user_password = 'newpassword'
WHERE pollOfficer_user_name = 'mJohnson';

-- To delete a specific user:

DELETE FROM admin WHERE admin_id = 1;

DELETE FROM pollOfficer WHERE pollOfficer_id = 1;

-- To clear all data records:

EXEC sp_MSForEachTable "ALTER TABLE ? NOCHECK CONSTRAINT all";
EXEC sp_MSForEachTable "DELETE FROM ?";
EXEC sp_MSForEachTable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT all";

-- Candidates with the top 2 highest voting record:
CREATE VIEW top2Candidates AS
SELECT TOP(2) candidate_fName, candidate_lName, total_votes
FROM candidate
ORDER BY total_votes DESC;

-- Candidate with the least voting record:
CREATE VIEW leastCandidate AS
SELECT TOP(1) candidate_fName, candidate_lName, total_votes
FROM candidate
ORDER BY total_votes ASC;

-- Candidate who got votes between 5 to 15:
CREATE VIEW candidateBetween5And15 AS
SELECT candidate_fName, candidate_lName, total_votes
FROM candidate
WHERE total_votes BETWEEN 5 AND 15;

-- Voting record for each registered candidate:
CREATE VIEW candidateVotingRecord AS
SELECT candidate_fName, candidate_lName, total_votes
FROM candidate;

-- Winner candidate name:
CREATE VIEW winnerCandidate AS
SELECT candidate_fName, candidate_lName
FROM candidate
WHERE total_votes = (SELECT MAX(total_votes) FROM candidate);