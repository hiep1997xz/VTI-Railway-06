DROP DATABASE IF EXISTS testingsystem;
CREATE DAtABASE testingsystem;
USE testingsystem;

CREATE TABLE department(
	department_id		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    department_name		NVARCHAR(255)
);

CREATE TABLE `position`(
	position_id			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    position_name		ENUM('dev','test','scrum_master','pm')
);

CREATE TABLE `account`(
	account_id			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    email				TEXT,
    use_name			NVARCHAR(255),
    full_name			NVARCHAR(255),
    department_id 		TINYINT UNSIGNED,
    position_id			TINYINT UNSIGNED,
    create_name			DATE,
    FOREIGN KEY (department_id) REFERENCES department(department_id),
    FOREIGN KEY (position_id) REFERENCES `position`(position_id)
);

CREATE TABLE `group`(
	group_id			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    group_name			NVARCHAR(255),
    creator_id			TINYINT UNSIGNED,
    create_date			DATE,
    FOREIGN KEY (creator_id) REFERENCES `account`(account_id)
);

CREATE TABLE group_account(
	group_id		TINYINT UNSIGNED,
    account_id		TINYINT UNSIGNED,
    join_date		DATE,
    FOREIGN KEY (group_id) REFERENCES `group`(group_id),
    FOREIGN KEY (account_id) REFERENCES `account`(account_id)
);

CREATE TABLE type_question(
	type_id			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	type_name		ENUM('essay','multiple-choice')
);

CREATE TABLE category_question(
	category_id		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    caretory_name	ENUM('java','.net','sql','postman','ruby')
);

CREATE TABLE question(
	question_id			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    content				TEXT,
    category_id			TINYINT UNSIGNED,
    type_id				TINYINT UNSIGNED,
    creator_id			TINYINT UNSIGNED,
    create_date			DATE,
    FOREIGN KEY (category_id) REFERENCES category_question(category_id),
    FOREIGN KEY (type_id) REFERENCES type_question(type_id),
    FOREIGN KEY (creator_id) REFERENCES `account`(account_id)
);

CREATE TABLE answer(
	ansewer_id		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    content			TEXT,
    question_id		TINYINT UNSIGNED,
    is_correct		NVARCHAR(255),
    FOREIGN KEY (question_id) REFERENCES question(question_id)
);

CREATE TABLE exam(
	exam_id			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `code`			NVARCHAR(255),
	title			NVARCHAR(255),
    category_id		TINYINT UNSIGNED,
    duration		NVARCHAR(255),
    creator_id		TINYINT UNSIGNED,
    create_date		DATE,
    FOREIGN KEY (category_id) REFERENCES category_question(category_id),
    FOREIGN KEY (creator_id) REFERENCES `account`(account_id)
);

CREATE TABLE exam_question(
	exam_id			TINYINT UNSIGNED,
    question_id 	TINYINT UNSIGNED,
    FOREIGN KEY (exam_id) REFERENCES exam(exam_id),
    FOREIGN KEY (question_id) REFERENCES question(question_id)
);

INSERT INTO department(department_id, department_name) VALUES
(1,		N'Nhân sự'),
(2,		N'Kế toán'),
(3,		N'Bảo vệ'),
(4,		N'bảo vệ'),
(5,		N'bán hàng');

