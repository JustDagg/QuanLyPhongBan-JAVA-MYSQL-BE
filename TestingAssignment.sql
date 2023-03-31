-- create database
DROP DATABASE IF EXISTS TestingSystem;
CREATE DATABASE TestingSystem;
USE TestingSystem;

-- create table: Department
DROP TABLE IF EXISTS Department;
CREATE TABLE Department(
	DepartmentID 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    DepartmentName 			NVARCHAR(30) NOT NULL UNIQUE KEY,
    author_id				TINYINT UNSIGNED,
    CreateDate				DATETIME DEFAULT NOW(),
    ModifiedDate			DATETIME DEFAULT NOW() 
);

-- create table: Account
DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account`(
	AccountID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Email					VARCHAR(50) NOT NULL UNIQUE KEY, 
    Username				VARCHAR(50) NOT NULL UNIQUE KEY,
    `password` 				VARCHAR(800) NOT NULL,
    FirstName				NVARCHAR(50) NOT NULL,
    LastName				NVARCHAR(50) NOT NULL,	
    DepartmentID 			TINYINT UNSIGNED,	
    CreateDate				DATETIME DEFAULT NOW(),
    `Role` 					ENUM('Admin','User','Manager') NOT NULL DEFAULT 'User',
    FOREIGN KEY(DepartmentID) REFERENCES Department(DepartmentID) ON DELETE SET NULL
);

/*============================== INSERT DATABASE =======================================*/
/*======================================================================================*/
-- Add data Department
INSERT INTO Department	(DepartmentName, author_id	,	CreateDate	 ,	ModifiedDate)
VALUES                  (N'Marketing'	,	5		,	'2021-03-05' ,	'2021-03-05'),
						(N'Sale'		,	1		,	'2021-03-07' ,	'2021-03-07'),
						(N'Bảo vệ'		,	2		,	'2021-03-08' ,	'2021-03-08'),
						(N'Nhân sự'		,	3		,	'2021-03-10' ,	'2021-03-10'),
						(N'Kỹ thuật'	,	4		,	NOW()		 ,	NOW()		),
						(N'Tài chính'	,	6		,	NOW()		 ,	NOW()		),
						(N'Phó giám đốc',	7		,	'2021-04-07' ,	'2021-04-07'),
						(N'Giám đốc'	,	8		,	'2021-04-07' ,	'2021-04-07'),
						(N'Thư kí'		,	9		,	'2021-04-09' ,	'2021-04-09'),
						(N'Bán hàng'	,	5		,	'2021-04-09' ,	'2021-04-09'),
                        (N'Bán hàng1'	,	5		,	'2021-04-09' ,	'2021-04-09');

-- Add data Account
-- password: 123456
INSERT INTO `Account`(Email								, Username			,	`password`,															FirstName,		LastName,		 DepartmentID	,	CreateDate		,	`Role`		)
VALUES 				('hangnga@gmail.com'				, 'hangnga'			,	'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',		'Nga'	,		'Phan Hang'		,   '1'			,	'2020-03-05'	,	'Admin'		),
					('tuandang@gmail.com'				, 'tuandang'		,	'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',		'Tuan'	,		'Dang Minh'		,   '1'			,	'2020-03-05'	,	'Admin'		),
                    ('haihuy@gmail.com'					, 'haihuy'			,	'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',		'Huy'	,		'Nguyen Hai'	,   '2'			,	'2020-03-07'	,	'User'		),
                    ('quanghai@gmail.com'				, 'quanghai'		,	'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',		'Hai'	,		'Nguyen Quang'	,   '3'			,	'2020-03-08'	,	'User'		),
                    ('tuanson@gmail.com'				, 'tuanson'			,	'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',		'Son'	,		'Hoang Tuan'  	,   '4'			,	'2020-03-10'	,	'User'		),
                    ('quynhanh@gmail.com'				, 'quynhanh'		,	'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',		'Anh'	,		'Phan Quynh'	,   '1'			,	NOW()			,	'Admin'		),
                    ('tramy@gmail.com'					, 'tramy'			,	'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',		'My'	,		'Hua Tra'		,   '7'			,	NOW()			,	'Admin'		),
                    ('ducquang@gmail.com'				, 'ducquang'		,	'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',		'Quang'	,		'Hoang Duc'		,   '8'			,	'2020-04-07'	,	'Manager'	),
                    ('minhanh@gmail.com'				, 'minhanh'			,	'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',		'Anh'	,		'Dang Minh'		,   '9'			,	'2020-04-07'	,	'Manager'	),
                    ('xuantruong@gmail.com'				, 'xuantruong'		,	'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',		'Truong',		'Nguyen Xuan'	,   '10'		,	'2020-04-09'	,	'Manager'	);

ALTER TABLE Department
ADD FOREIGN KEY (author_id) REFERENCES `Account`(AccountID);
