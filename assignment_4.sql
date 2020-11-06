DROP DATABASE IF EXISTS testingsystem;
CREATE DAtABASE testingsystem;
USE testingsystem;

CREATE TABLE department(
	department_id		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    department_name		NVARCHAR(100)
);

CREATE TABLE `position`(
	position_id			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    position_name		ENUM('dev','test','scrum_master','pm')
);

CREATE TABLE `account`(
	account_id			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    email				NVARCHAR(100) UNIQUE KEY,
    user_name			NVARCHAR(100),
    full_name			NVARCHAR(100),
    department_id 		TINYINT UNSIGNED,
    position_id			TINYINT UNSIGNED,
    create_date			DATE,
    FOREIGN KEY (department_id) REFERENCES department(department_id),
    FOREIGN KEY (position_id) REFERENCES `position`(position_id)
);

CREATE TABLE `group`(
	group_id			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    group_name			NVARCHAR(100),
    creator_id			TINYINT UNSIGNED,
    create_date			DATE,
    FOREIGN KEY (creator_id) REFERENCES `account`(account_id)
);

CREATE TABLE group_account(
	group_id		TINYINT UNSIGNED,
    account_id		TINYINT UNSIGNED,
    join_date		DATE,
    PRIMARY KEY (group_id,account_id),
    FOREIGN KEY (group_id) REFERENCES `group`(group_id),
    FOREIGN KEY (account_id) REFERENCES `account`(account_id)
);

CREATE TABLE type_question(
	type_id			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	type_name		ENUM('essay','multiple-choice') NOT NULL UNIQUE KEY
);

CREATE TABLE category_question(
	category_id		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    category_name	NVARCHAR(50) NOT NULL UNIQUE KEY
);

DROP DATABASE IF EXISTS question;
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
    is_correct		BIT DEFAULT 1,
    FOREIGN KEY (question_id) REFERENCES question(question_id)
);

CREATE TABLE exam(
	exam_id			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `code`			NVARCHAR(255) NOT NULL,
	title			NVARCHAR(255) NOT NULL,
    category_id		TINYINT UNSIGNED,
    duration		TINYINT UNSIGNED,
    creator_id		TINYINT UNSIGNED,
    create_date		DATE,
    FOREIGN KEY (category_id) REFERENCES category_question(category_id),
    FOREIGN KEY (creator_id) REFERENCES `account`(account_id)
);

CREATE TABLE exam_question(
	exam_id			TINYINT UNSIGNED,
    question_id 	TINYINT UNSIGNED,
    PRIMARY KEY (exam_id,question_id),
    FOREIGN KEY (exam_id) REFERENCES exam(exam_id),
    FOREIGN KEY (question_id) REFERENCES question(question_id)
);

-- question1: Thêm ít nhất 10 record vào mỗi table
INSERT INTO department(department_name)
VALUES
				(N'Nhân sự'		),
                (N'Kế toán'		),
                (N'Bảo vệ'		),
                (N'Kỹ thuật'	),
                (N'Marketing'	),
                (N'Sale'		),
                (N'Bán Hàng'	),
                (N'Giám đốc'	),
                (N'Tài chính'	),
                (N'Thư kí'		);

INSERT INTO `position`	(position_name)
VALUES					(N'dev'			),
						(N'test'		),
						(N'scrum_master'),
						(N'pm'			);

INSERT INTO `account`	(email								,user_name			,full_name				,department_id	,position_id	,create_date)
VALUES					('haidang29productions@gmail.com'	, 'dangblack'		,'Nguyen Hai Dang'		,   '5'			,   '1'			,'2020-03-05'),
						('account1@gmail.com'				, 'quanganh'		,'Tong Quang Anh'		,   '1'			,   '2'			,'2020-03-05'),
						('account2@gmail.com'				, 'vanchien'		,'Nguyen Van Chien'		,   '1'			,   '3'			,'2020-03-07'),
						('account3@gmail.com'				, 'cocoduongqua'	,'Duong Do'				,   '2'			,   '4'			,'2020-03-08'),
						('account4@gmail.com'				, 'doccocaubai'		,'Nguyen Chien Thang'	,   '2'			,   '4'			,'2020-03-10'),
						('dapphatchetngay@gmail.com'		, 'khabanh'			,'Ngo Ba Kha'			,   '3'			,   '3'			,'2020-04-05'),
						('songcodaoly@gmail.com'			, 'huanhoahong'		,'Bui Xuan Huan'		,   '4'			,   '2'			,'2020-04-05'),
						('sontungmtp@gmail.com'				, 'tungnui'			,'Nguyen Thanh Tung'	,   '3'			,   '1'			,'2020-04-07'),
						('duongghuu@gmail.com'				, 'duongghuu'		,'Duong Van Huu'		,   '3'			,   '2'			,'2020-04-07'),
						('vtiaccademy@gmail.com'			, 'vtiaccademy'		,'Vi Ti Ai'				,   '6'			,   '1'			,'2020-04-09');
						
INSERT INTO `group` (group_name				,creator_id		,create_date)
VALUES				(N'Testing System'		,   5			,'2019-03-05'),
					(N'Developement'		,   1			,'2020-03-07'),
                    (N'VTI Sale 01'			,   2			,'2020-03-09'),
                    (N'VTI Sale 02'			,   3			,'2020-03-10'),
                    (N'VTI Sale 03'			,   4			,'2020-03-28'),
                    (N'VTI Creator'			,   6			,'2020-04-06'),
                    (N'VTI Marketing 01'	,   7			,'2020-04-07'),
                    (N'Management'			,   8			,'2020-04-08'),
                    (N'Chat with love'		,   9			,'2020-04-09'),
                    (N'Vi Ti Ai'			,   10			,'2020-04-10');

INSERT INTO group_account	(group_id	,account_id	,join_date)
VALUES						(	1		,    1		,'2019-03-05'),
							(	1		,    2		,'2020-03-07'),
							(	3		,    3		,'2020-03-09'),
							(	3		,    4		,'2020-03-10'),
							(	5		,    5		,'2020-03-28'),
							(	1		,    3		,'2020-04-06'),
							(	1		,    7		,'2020-04-07'),
							(	8		,    3		,'2020-04-08'),
							(	1		,    9		,'2020-04-09'),
							(	10		,    10		,'2020-04-10');

INSERT INTO type_question	(type_name)
VALUES						('Essay'			), 
							('Multiple-Choice'	);

INSERT INTO category_question	(category_name)
VALUES 							(N'Java'		),
								(N'ASP.NET'		),
								(N'ADO.NET'		),
								(N'SQL'			),
								(N'Postman'		),
								(N'Ruby'		),
								(N'Python'		),
								(N'C++'			),
								(N'C Sharp'		),
								(N'PHP'			);


	INSERT INTO question	(content			,category_id	,type_id		,creator_id		,create_date)
    VALUES					(N'Câu hỏi về Java'	,	1			,   '1'			,   '1'			,'2020-04-05'),
							(N'Câu Hỏi về PHP'	,	10			,   '2'			,   '2'			,'2020-04-05'),
							(N'Hỏi về C#'		,	9			,   '2'			,   '3'			,'2020-04-06'),
							(N'Hỏi về Ruby'		,	6			,   '1'			,   '4'			,'2020-04-06'),
							(N'Hỏi về Postman'	,	5			,   '1'			,   '5'			,'2020-04-06'),
							(N'Hỏi về ADO.NET'	,	3			,   '2'			,   '6'			,'2020-04-06'),
							(N'Hỏi về ASP.NET'	,	2			,   '1'			,   '7'			,'2020-04-06'),
							(N'Hỏi về C++'		,	8			,   '1'			,   '8'			,'2020-04-07'),
							(N'Hỏi về SQL'		,	4			,   '2'			,   '9'			,'2020-04-07'),
							(N'Hỏi về Python'	,	7			,   '1'			,   '10'		,'2020-04-07');

INSERT INTO answer 	(content		,question_id	,is_correct	)
VALUES				(N'Trả lời 01'	,   1			,	0		),
					(N'Trả lời 02'	,   1			,	1		),
                    (N'Trả lời 03'	,   1			,	0		),
                    (N'Trả lời 04'	,   1			,	1		),
                    (N'Trả lời 05'	,   2			,	1		),
                    (N'Trả lời 06'	,   3			,	1		),
                    (N'Trả lời 07'	,   4			,	0		),
                    (N'Trả lời 08'	,   8			,	0		),
                    (N'Trả lời 09'	,   9			,	1		),
                    (N'Trả lời 10'	,   10			,	1		);

INSERT INTO exam	(`code`			,title					,category_id	,duration	,creator_id		,create_date)
VALUES				(N'VTIQ001'		, N'Đề thi C#'			,	1			,	60		,   '5'			,'2019-04-05'),
					(N'VTIQ002'		, N'Đề thi PHP'			,	10			,	60		,   '1'			,'2019-04-05'),
                    (N'VTIQ003'		, N'Đề thi C++'			,	9			,	120		,   '2'			,'2019-04-07'),
                    (N'VTIQ004'		, N'Đề thi Java'		,	6			,	60		,   '3'			,'2020-04-08'),
                    (N'VTIQ005'		, N'Đề thi Ruby'		,	5			,	120		,   '4'			,'2020-04-10'),
                    (N'VTIQ006'		, N'Đề thi Postman'		,	3			,	60		,   '6'			,'2020-04-05'),
                    (N'VTIQ007'		, N'Đề thi SQL'			,	2			,	60		,   '7'			,'2020-04-05'),
                    (N'VTIQ008'		, N'Đề thi Python'		,	8			,	60		,   '8'			,'2020-04-07'),
                    (N'VTIQ009'		, N'Đề thi ADO.NET'		,	4			,	90		,   '9'			,'2020-04-07'),
                    (N'VTIQ010'		, N'Đề thi ASP.NET'		,	7			,	90		,   '10'		,'2020-04-08');

INSERT INTO exam_question	(exam_id	,question_id	)
VALUES						(	1		,		5		),
							(	2		,		10		), 
							(	3		,		4		), 
							(	4		,		3		), 
							(	5		,		7		), 
							(	6		,		10		), 
							(	7		,		2		), 
							(	8		,		10		), 
							(	9		,		9		), 
							(	10		,		8		); 
                            
--  Assignment 4

-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
SELECT *
FROM `account`
LEFT JOIN department USING(department_id);

-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010
SELECT *
FROM `account`
JOIN department USING(department_id)
WHERE create_date > '2010/12/20';

-- Question 3: Viết lệnh để lấy ra tất cả các developer
SELECT *
FROM `account`
JOIN `position` USING(position_id)
WHERE position_name = ('Dev');

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >=3 nhân viên ( GROUP BY )
SELECT *,COUNT(1)
FROM `account`
JOIN department USING(department_id)
GROUP BY (department_id)
HAVING COUNT(department_id) >=3;

-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất
SELECT *
FROM `question` q
LEFT JOIN exam_question eq ON eq.question_id = q.question_id
GROUP BY q.question_id
HAVING COUNT(eq.exam_id) = (SELECT MAX(So_Luong_Exam)
								FROM 
								(SELECT COUNT(eq.exam_id) AS So_Luong_Exam
								FROM question q
								LEFT JOIN exam_question eq ON eq.question_id = q.question_id
								GROUP BY q.question_id )AS statistic_Question_Exam );

SELECT *,COUNT(EQ.exam_id) AS So_Luong_Exam
FROM question q
LEFT JOIN exam_question eq ON EQ.question_id = Q.question_id
GROUP BY (Q.question_id);

SELECT GROUP_CONCAT(exam_id), question_id,COUNT(1)
FROM exam_question
GROUP BY question_id
HAVING COUNT(1) = (SELECT COUNT(1)
					FROM exam_question
					GROUP BY question_id
					ORDER BY COUNT(1) DESC
					LIMIT 1
);

SELECT GROUP_CONCAT(exam_id), question_id,COUNT(1),content
FROM exam_question
JOIN `question` USING(question_id)
GROUP BY question_id
HAVING COUNT(1) = (
SELECT COUNT(1)
FROM exam_question
GROUP BY question_id
ORDER BY COUNT(1) DESC
LIMIT 1
);
-- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
SELECT cq.category_id, cq.category_name, q.question_id
FROM category_question cq
LEFT JOIN question q ON cq.category_id = q.category_id
GROUP BY cq.category_id
HAVING COUNT(q.question_id);

-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
SELECT q.question_id, eq.exam_id
FROM `question` q
LEFT JOIN exam_question eq ON q.question_id = eq.question_id
GROUP By q.question_id 
HAVING COUNT(eq.question_id);

-- Question 8: Lấy ra Question có nhiều câu trả lời nhất
SELECT *,COUNT(e.question_id) as so_lương_cau_hoi
FROM `question` q
LEFT JOIN answer e ON q.question_id = e.question_id
GROUP BY e.question_id
HAVING COUNT(e.question_id) = (SELECT MAX(So_Luong_Exam)
								FROM 
								(SELECT COUNT(e.question_id) AS So_Luong_Exam
								FROM question q
								LEFT JOIN answer e ON q.question_id = e.question_id
								GROUP BY e.question_id )AS statistic_Question_Exam );

-- Question 9: Thống kê số lượng account trong mỗi group
SELECT COUNT(account_id), group_id, group_name
FROM group_account
RIGHT JOIN `group` USING (group_id)
GROUP BY group_id;

-- Question 10: Tìm chức vụ có ít người nhất
SELECT *,COUNT(a.account_id)
FROM `position` p
JOIN `account` a ON a.position_id = p.position_id
GROUP BY p.position_id 
HAVING COUNT(a.account_id) = 2;

SELECT *,COUNT(position_id)
FROM `account` 
GROUP BY position_id;

-- Question 11: Thống kê mỗi phòng ban có bao nhiêu nhân viên thuộc 1 trong 4 chức vụ dev, test, scrum master, PM
SELECT *
FROM `account`
JOIN `position` USING (position_id)
WHERE position_name IN('dev','test','scrum_master','pm')
GROUP BY department_id;

SELECT *,COUNT(department_id)
FROM `account`
GROUP BY department_id;


SELECT d.department_name, p.position_name
FROM `account` a
RIGHT JOIN department d ON a.department_id = d.department_id
LEFT JOIN `position` p ON a.position_id = p.position_id
WHERE p.position_name = 'dev'
UNION
SELECT d.department_name, p.position_name
FROM `account` a
RIGHT JOIN department d ON a.department_id = d.department_id
LEFT JOIN `position` p ON a.position_id = p.position_id
WHERE p.position_name = 'test'
UNION
SELECT d.department_name, p.position_name
FROM `account` a
RIGHT JOIN department d ON a.department_id = d.department_id
LEFT JOIN `position` p ON a.position_id = p.position_id
WHERE p.position_name = 'scrum_master'
UNION
SELECT d.department_name, p.position_name
FROM `account` a
RIGHT JOIN department d ON a.department_id = d.department_id
LEFT JOIN `position` p ON a.position_id = p.position_id
WHERE p.position_name = 'pm';

-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, ...
SELECT *
FROM `question` q
LEFT JOIN type_question tp ON q.type_id = tp.type_id
LEFT JOIN `account` a ON a.account_id = q.creator_id
LEFT JOIN answer an ON q.question_id = an.question_id;

-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
SELECT *
FROM type_question tq
LEFT JOIN question q ON q.type_id = tq.type_id
GROUP BY tq.type_name;

-- Question 14:Lấy ra group không có account nào
SELECT *
FROM `group` g
LEFT JOIN group_account ga ON g.group_id = ga.group_id
WHERE g.group_id IS NULL;
    
-- Question 15: Lấy ra group không có account nào
SELECT *
FROM `group` g
LEFT JOIN group_account ga ON g.group_id = ga.group_id
WHERE g.group_id IS NULL;

-- Question 16: Lấy ra question không có answer nào
SELECT *
FROM `question` q
LEFT JOIN answer a ON q.question_id = a.question_id
WHERE a.question_id IS NULL;

-- Question 17:
-- a) Lấy các account thuộc nhóm thứ 1
SELECT *
FROM `account`
JOIN group_account USING (account_id)
WHERE group_id = 1;

-- b) Lấy các account thuộc nhóm thứ 2
SELECT *
FROM `account`
JOIN group_account USING (account_id)
WHERE group_id = 3;

-- c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau
SELECT *
FROM `account`
JOIN group_account USING (account_id)
WHERE group_id = 1

UNION

SELECT *
FROM `account`
JOIN group_account USING (account_id)
WHERE group_id = 3;

-- Question 18:
-- a) Lấy các group có lớn hơn 5 thành viên
SELECT *,COUNT(ag.group_id) AS so_lương_thanh_vien
FROM `group` g
JOIN  group_account ag ON g.group_id = ag.group_id
GROUP BY ag.group_id
HAVING COUNT(ag.group_id) > 3;

-- b) Lấy các group có nhỏ hơn 7 thành viên
SELECT *,COUNT(ag.group_id) AS so_lương_thanh_vien
FROM `group` g
JOIN  group_account ag ON g.group_id = ag.group_id
GROUP BY ag.group_id
HAVING COUNT(ag.group_id) < 7;

-- c) Ghép 2 kết quả từ câu a) và câu b)
SELECT *,COUNT(ag.group_id) AS so_lương_thanh_vien
FROM `group` g
JOIN  group_account ag ON g.group_id = ag.group_id
GROUP BY ag.group_id
HAVING COUNT(ag.group_id) > 3

UNION

SELECT *,COUNT(ag.group_id) AS so_lương_thanh_vien
FROM `group` g
JOIN  group_account ag ON g.group_id = ag.group_id
GROUP BY ag.group_id
HAVING COUNT(ag.group_id) < 7;
                            