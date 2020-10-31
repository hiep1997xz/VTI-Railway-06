DROP DATABASE IF EXISTS testingsystem_2;
CREATE DATABASE testingsystem_2;
USE testingsystem_2;

CREATE TABLE trainee(
	trainee_id			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    full_name			NVARCHAR(255),
    birth_date			DATE,
    gender				ENUM('male','female','unknown'),
    et_iq				NVARCHAR(255),
    et_gmath			NVARCHAR(255),
    et_english			NVARCHAR(255),
    traning_class		NVARCHAR(255),
    evaluation_notes	TEXT,
    CHECK (et_iq >= 0 && et_iq <= 20),
    CHECK (et_gmath >= 0 && et_gmath <= 20),
    CHECK (et_english >= 0 && et_english <=50) 
);