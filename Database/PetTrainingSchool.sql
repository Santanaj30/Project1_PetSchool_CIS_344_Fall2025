CREATE DATABASE PetTrainingSchool;
USE PetTrainingSchool;

-- 1) Owner table
CREATE TABLE Owner (
  OwnerID INT AUTO_INCREMENT PRIMARY KEY,
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  Phone VARCHAR(20),
  Email VARCHAR(100)
);

-- 2) Pet table
CREATE TABLE Pet (
  PetID INT AUTO_INCREMENT PRIMARY KEY,
  OwnerID INT NOT NULL,
  PetName VARCHAR(50) NOT NULL,
  Species VARCHAR(50),
  Breed VARCHAR(50),
  FOREIGN KEY (OwnerID) REFERENCES Owner(OwnerID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- 3) Trainer table
CREATE TABLE Trainer (
  TrainerID INT AUTO_INCREMENT PRIMARY KEY,
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  Specialty VARCHAR(100)
);

-- 4) Course table
CREATE TABLE Course (
  CourseID INT AUTO_INCREMENT PRIMARY KEY,
  Title VARCHAR(100) NOT NULL,
  Description TEXT,
  Price DECIMAL(8,2)
);

-- 5) Enrollment table (linking Pet, Course, and Trainer)
CREATE TABLE Enrollment (
  EnrollmentID INT AUTO_INCREMENT PRIMARY KEY,
  PetID INT NOT NULL,
  CourseID INT NOT NULL,
  TrainerID INT NOT NULL,
  Status ENUM('Enrolled','Completed','Dropped') DEFAULT 'Enrolled',
  FOREIGN KEY (PetID) REFERENCES Pet(PetID),
  FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
  FOREIGN KEY (TrainerID) REFERENCES Trainer(TrainerID));

INSERT INTO Owner (FirstName, LastName, Phone, Email) VALUES
('Jorge','Santana','555-1111','Jorge@hotmail.com'),
('Bob','Martinez','555-2222','bob@hotmail.com');

INSERT INTO Pet (OwnerID, PetName, Species, Breed) VALUES
(1,'Buddy','Dog','Golden Retriever'),
(1,'Whiskers','Cat','Siamese'),
(2,'Max','Dog','Bulldog');

INSERT INTO Trainer (FirstName, LastName, Specialty) VALUES
('Sarah','Lopez','Obedience'),
('David','Kim','Agility');

INSERT INTO Course (Title, Description, Price) VALUES
('Basic Obedience','Introduction to commands and discipline',150.00),
('Advanced Agility','Course for competitive agility training',300.00);

INSERT INTO Enrollment (PetID, CourseID, TrainerID, Status) VALUES
(1,1,1,'Enrolled'),
(2,1,1,'Completed'),
(3,2,2,'Enrolled');

SELECT * FROM Enrollment;