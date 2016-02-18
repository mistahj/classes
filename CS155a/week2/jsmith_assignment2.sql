/* Justin Smith */

USE bookstore;

  -- Query 1 
CREATE TABLE computer (
	serial_number INT(7) NOT NULL,
	make VARCHAR(7), 
	model VARCHAR(25),
	processor_type VARCHAR(20),
	memory VARCHAR(12),
	disk_size VARCHAR(12),
	PRIMARY KEY (serial_number)
) ENGINE=INNODB;

/* Query 2
Professor provided code */

 -- Query 3 
ALTER TABLE computer
ADD COLUMN processor_speed VARCHAR(6);

/* Query 4 
Professor provided code */

/* Query 5 */
DESCRIBE computer;

/* Query 6 
Professor provided code */

/* Query 7 */
ALTER TABLE computer
DROP COLUMN processor_speed;

/* Query 8 
Professor provided code */

/* Query 9 */
RENAME TABLE computer
TO computer_backup;

/* Query 10 */
SHOW TABLES;

/* Query 11 */
DROP TABLE computer_backup;
mysql> tee /Users/jsmith/Desktop/CS155a/week2/jsmith_assignment2.sql >
