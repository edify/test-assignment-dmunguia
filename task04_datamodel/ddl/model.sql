

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema lms
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `lms` ;

-- -----------------------------------------------------
-- Schema lms
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lms` DEFAULT CHARACTER SET utf8 ;
USE `lms` ;

-- -----------------------------------------------------
-- Add your tables here
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS term (
    id              INT AUTO_INCREMENT PRIMARY_KEY,
    ordinal         TINYINT NOT NULL, -- first, second, third, etc
    term_type       ENUM('semester', 'bimester', 'trimester') NOT NULL,
    year            TINYINT NOT NULL,
    created_on      TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, -- audit field creation timestamp
    last_updated_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, -- audit field last update timestamp
    v               INT NOT NULL DEFAULT 0 --audit field version
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS course (
    id              INT AUTO_INCREMENT PRIMARY_KEY,
    code            VARCHAR(255) NOT NULL,
    name            VARCHAR(255) NOT NULL,
    created_on      TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, -- audit field creation timestamp
    last_updated_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, -- audit field last update timestamp
    v               INT NOT NULL DEFAULT 0 --audit field version
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS faculty (
    id              INT AUTO_INCREMENT PRIMARY_KEY,
    name            VARCHAR(255) NOT NULL,
    last_name       VARCHAR(255) NOT NULL,
    created_on      TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, -- audit field creation timestamp
    last_updated_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, -- audit field last update timestamp
    v               INT NOT NULL DEFAULT 0 --audit field version
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS student (
    id              INT AUTO_INCREMENT PRIMARY_KEY,
    name            VARCHAR(255) NOT NULL,
    last_name       VARCHAR(255) NOT NULL,
    created_on      TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, -- audit field creation timestamp
    last_updated_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, -- audit field last update timestamp
    v               INT NOT NULL DEFAULT 0 --audit field version
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS course_instance (
    id              INT AUTO_INCREMENT PRIMARY_KEY,
    course_id       INT,
    term_id         INT,     
    created_on      TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, -- audit field creation timestamp
    last_updated_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, -- audit field last update timestamp
    v               INT NOT NULL DEFAULT 0, --audit field version
    FOREIGN KEY (course_id) REFERENCES course(id),
    FOREIGN KEY (term_id) REFERENCES term(id)
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS course_enrollments (
    id                  INT AUTO_INCREMENT PRIMARY_KEY,
    course_instance_id  INT NOT NULL,
    student_id          INT NOT NULL,     
    final_grade         DECIMAL(3,2) NOT NULL,
    created_on          TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, -- audit field creation timestamp
    last_updated_on     TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, -- audit field last update timestamp
    v                   INT NOT NULL DEFAULT 0, --audit field version
    FOREIGN KEY (course_instance_id) REFERENCES course_instance(id),
    FOREIGN KEY (student_id) REFERENCES student(id),
) ENGINE=INNODB;

-- -----------------------------------------------------

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
