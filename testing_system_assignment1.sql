DROP DATABASE IF EXISTS testingsystem;
CREATE DATABASE testingsystem;
USE testingsystem;

CREATE TABLE department(
department_id			INT,
department_name			VARCHAR(50)
);

CREATE TABLE position_ (
position_id			INT,
position_name		VARCHAR(50)
);

CREATE TABLE account_(
account_id			INT,
email				VARCHAR(50),
usename				VARCHAR(50),
fullname			VARCHAR(50),
department_id		INT,
position_id			INT,
create_date			DATE
);

CREATE TABLE group_(
group_id		INT,
group_name		VARCHAR(50),
creator_id		INT,
create_date		DATE
);

CREATE TABLE groupaccount(
group_id		INT,
account_id		INT,
join_date		DATE
);

CREATE TABLE typequestion(
type_id		INT,
type_name	VARCHAR(50)
);

CREATE TABLE categoryquestion(
category_id		INT,
category_name	VARCHAR(50)
);

CREATE TABLE question(
question_id			INT,
content				VARCHAR(50),
category_id			INT,
type_id				INT,
creator_id			INT,
create_date			DATE
);

CREATE TABLE answer(
answer_id		INT,
content			VARCHAR(50),
question_id		INT,
iscorrect		VARCHAR(50)
);

CREATE TABLE exam(
exam_id		INT,
code_		VARCHAR(50),
title		VARCHAR(50),
category_id	INT,
duration	VARCHAR(50),
creator_id	INT,
create_date	DATE
);

CREATE TABLE examquestion(
exam_id		INT,
question_id	INT
);














