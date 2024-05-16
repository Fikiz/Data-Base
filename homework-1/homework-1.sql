CREATE TABLE IF NOT EXISTS student (
	id SERIAL PRIMARY KEY,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	date_of_birth TIMESTAMPTZ NOT NULL,
	enrolled_date DATE NOT NULL,
	gender VARCHAR(50),
	national_id INTEGER NOT NULL,
	studentd_card_number INTEGER NOT NULL
);

CREATE TABLE IF  NOT EXISTS teacher (
	id SERIAL PRIMARY KEY,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	date_of_birth DATE  NOT NULL,
	academic_rank VARCHAR(20),
	hire_date DATE
);

CREATE TABLE IF NOT EXISTS grade_details(
	id SERIAL PRIMARY KEY,
	grade_id INTEGER NOT NULL,
	achivment_type_id INTEGER NOT NULL,
	achivment_points INTEGER NOT NULL,
	achivment_max_points INTEGER NOT NULL,
	achivment_date DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS course (
	id SERIAL PRIMARY KEY,
	name VARCHAR(20) NOT NULL,
	credit VARCHAR(20) NOT NULL,
	academic_year VARCHAR(10) NOT NULL,
	semester VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS grade (
	id SERIAL PRIMARY KEY,
	student_id UUID,
	course_id UUID,
	teacher_id UUID,
	grade VARCHAR(20),
	comment VARCHAR(20),
	createdDate DATE
	
);

CREATE TABLE IF NOT EXISTS achivment_type (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	description VARCHAR(500),
	participation_rate FLOAT
);