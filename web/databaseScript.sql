create table admin(
	username varchar(20) primary key,
	password varchar(20)
	
);


create table appointment(
	firstname varchar(20) primary key,
	lastname varchar(20),
        staff varchar(10),
        appointment_reason varchar(500),
        datetime varchar(20)
	
);

create table employee(
	username varchar(20) primary key,
	password varchar(20),
        fullname varchar(10),
        email varchar(20),
        staff varchar(10)
	
);

create table patient(
	username varchar(20) primary key,
	password varchar(20),
        fullname varchar(50),
        patient_type varchar(15),
        address varchar(100),
        postcode varchar(20),
        DOB varchar(20),
        prescription varchar(100), 
        invoice varchar(100),
        referal varchar(100)
        
	
);


INSERT INTO admin (username, password) VALUES ('admin', 'admin')


INSERT INTO appointment (firstname, lastname, staff, appointment_reason, datetime) VALUES ('jon', 'jiggy', 'nurse' 'bandage change' '01/03/2021 15:00')


INSERT INTO employee (username, password, fullname, email, staff) VALUES ('doctor1', '12345', 'alan smith' 'asmith@hotmail.com' 'doctor')
INSERT INTO employee (username, password, fullname, email, staff) VALUES ('nurse1', '2233', 'mary jada' 'mjada@hotmail.com' 'nurse')

INSERT INTO patient (username, password, fullname, patient_type, address, postcode, DOB, prescription, invoice, referal) VALUES ('j2jiggy', '188773', 'marrk kelvin', 'NHS patient', '05 woodcroft avenue whitehall bristol', 'BS5 9AS', '11/07/1998', '2 tablets of paracetamol every four hours', 'total amount is £130', 'alan refered')
INSERT INTO patient (username, password, fullname, patient_type, address, postcode, DOB, prescription, invoice, referal) VALUES ('a3missy', '23786', 'jane paul', 'private patient', '09 victoria street redfield bristol', 'BS9 6DE', '15/03/2000', '2 tablets of ibupprofen every four hours', 'total amount is £100', 'jiggy refered')




