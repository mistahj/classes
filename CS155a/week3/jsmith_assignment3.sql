-- Justin Smith

-- Query 1

CREATE DATABASE IF NOT EXISTS artcourse;

USE artcourse;

-- Query 2

CREATE TABLE customer(
	customer_number INT(11) AUTO_INCREMENT NOT NULL,
	last_name CHAR(25),
	first_name CHAR(25),
	phone CHAR(12),
	CONSTRAINT CUSTOMER_PK PRIMARY KEY (customer_number)
)
ENGINE = INNODB;

CREATE TABLE course(
	course_number INT(11) AUTO_INCREMENT NOT NULL,
	course_name CHAR(50),
	course_date DATETIME,
	fee DECIMAL(8,2),
	CONSTRAINT COURSE_PK PRIMARY KEY (course_number)
)
ENGINE = INNODB;

CREATE TABLE enrolls(
	customer_number INT(11),
	course_number INT(11),
	amount_paid DECIMAL(8,2),
	CONSTRAINT  ENROLLS_CUSTOMER_FK FOREIGN KEY (customer_number) 
		REFERENCES customer (customer_number),
	CONSTRAINT ENROLLS_COURSE_FK FOREIGN KEY (course_number) 
		REFERENCES course (course_number)
		ON DELETE CASCADE
)
ENGINE = INNODB;

-- Query 3

source /Users/jsmith/Desktop/my_scripts/insert_data_artcourse.sql;

-- Query 4

SELECT * FROM customer;

SELECT * FROM course;

SELECT * FROM enrolls;

-- Query 5

ALTER TABLE course
ADD date_added DATETIME;

-- Query 6

ALTER TABLE customer
MODIFY first_name  CHAR(20) NOT NULL;

-- Query 7

DESC course;

DESC customer;

DESC enrolls;