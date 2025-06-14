-- Create Database
CREATE DATABASE IF NOT EXISTS coursework_db;
USE coursework_db;

-- Table: Teacher
CREATE TABLE Teacher (
  TID INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  email VARCHAR(100) UNIQUE,
  password VARCHAR(255)
);

-- Table: Class
CREATE TABLE Class (
  CID INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  TID INT,
  FOREIGN KEY (TID) REFERENCES Teacher(TID)
);

-- Table: Student
CREATE TABLE Student (
  SID INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  email VARCHAR(100) UNIQUE,
  password VARCHAR(255),
  CID INT,
  FOREIGN KEY (CID) REFERENCES Class(CID)
);

-- Table: Task
CREATE TABLE Task (
  TKID INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  TK_desc TEXT,
  TID INT,
  FOREIGN KEY (TID) REFERENCES Teacher(TID)
);

-- Table: Student_TK
CREATE TABLE Student_TK (
  TKID INT,
  SID INT,
  is_checked BOOLEAN DEFAULT FALSE,
  PRIMARY KEY (TKID, SID),
  FOREIGN KEY (TKID) REFERENCES Task(TKID),
  FOREIGN KEY (SID) REFERENCES Student(SID)
);

-- Table: Submit
CREATE TABLE Submit (
  SUBID INT PRIMARY KEY AUTO_INCREMENT,
  draft_file VARCHAR(255),
  comment TEXT,
  status VARCHAR(50),
  SID INT,
  FOREIGN KEY (SID) REFERENCES Student(SID)
);

-- Sample Data
INSERT INTO Teacher (name, email, password)
VALUES 
('Mr. Ali', 'ali@example.com', MD5('pass123'));

INSERT INTO Class (name, TID)
VALUES 
('Business 101', 1);

INSERT INTO Student (name, email, password, CID)
VALUES 
('Saem', 'saem@example.com', MD5('secret123'), 1);

INSERT INTO Task (name, TK_desc, TID)
VALUES 
('Assignment 1', 'Research and write a report on marketing strategies.', 1);

INSERT INTO Student_TK (TKID, SID, is_checked)
VALUES 
(1, 1, FALSE);

INSERT INTO Submit (draft_file, comment, status, SID)
VALUES 
('assignment1.docx', 'First draft uploaded.', 'Pending', 1);
