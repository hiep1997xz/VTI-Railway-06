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
                            
-- Assignment 3
                            
-- Qestion2: lấy ra tất cả các phòng ban
SELECT*
FROM department;

SELECT*
FROM `account`;

-- Question 3: lấy ra id của phòng ban "Sale"
SELECT*
FROM department
WHERE department_name = 'Sale';

SELECT*
FROM `position`
WHERE position_name = 'Dev';

-- Question 4: lấy ra thông tin account có full name dài nhất
SELECT *
FROM `account`
WHERE length(full_name) = ( SELECT MAX(length(full_name)	)
							FROM 					`account`);

		-- cú pháp lấy full name dài nhất
SELECT length(full_name),full_name
FROM `account`;

SELECT *
FROM `account`
WHERE length(full_name) = 18;
		-- cách 2 lấy độ dài fullname dài nhất
SELECT length(full_name)
from `account`
order by length(full_name) desc
limit 1;

-- Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id = 3
SELECT *
FROM `account`
WHERE department_id = 3 AND LENGTH(full_name) = (SELECT MAX(LENGTH(full_name)));

-- Question 6: Lấy ra tên group đã tham gia trước ngày 20/12/2019
SELECT*
FROM `group`
WHERE create_date < '2019/12/20';

SELECT *
FROM exam
WHERE create_date > 2019/05/04;

-- Question 7: Lấy ra ID của question có >= 4 câu trả lời
SELECT *
FROM `question`
WHERE question_id >= 4; 

-- Question 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2019
SELECT *
FROM exam
WHERE duration >= 60 AND create_date > 2019/12/20;

-- Question 9: Lấy ra 5 group được tạo gần đây nhất
SELECT *
FROM `group`
ORDER BY group_name DESC LIMIT 5;

-- Question 10: Đếm số nhân viên thuộc department có id = 2
SELECT department_id, COUNT(department_id), GROUP_CONCAT(department_id)
FROM department
WHERE department_id = 2;

-- Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"
SELECT *
FROM `account`
WHERE full_name LIKE ('D%o');

-- Question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019
SET FOREIGN_KEY_CHECKS = 0;
DELETE
FROM exam
WHERE create_date < '2019-12-20';

-- Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"
SET FOREIGN_KEY_CHECKS = 0;
DELETE
FROM `question`
WHERE content LIKE ('câu hỏi%');

-- Question 14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và email thành loc.nguyenba@vti.com.vn
SELECT *
FROM `account`;
UPDATE `account`
SET		full_name = 'Nguyen Ba Loc',
		email = 'loc.nguyenba@vti.com.vn'
WHERE 	account_id = 5;

-- Question 15: update account có id = 5 sẽ thuộc group có id = 4
SELECT *
FROM group_account;
UPDATE group_account
SET account_id = 5
WHERE group_id = 4;

--  Assignment 4

-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
SELECT *
FROM `account`
LEFT JOIN department USING(department_id)

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
SELECT q.question_id
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
SELECT *,COUNT(ag.group_id) AS so_lương
FROM `group` g
LEFT JOIN  group_account ag ON g.group_id = ag.group_id
GROUP BY ag.group_id;

-- Question 10: Tìm chức vụ có ít người nhất

-- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM
-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, ...
-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm

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
