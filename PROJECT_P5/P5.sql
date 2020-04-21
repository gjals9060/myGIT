
/* Drop Triggers */

DROP TRIGGER TRI_blocking_id;
DROP TRIGGER TRI_booking_id;
DROP TRIGGER TRI_member_id;
DROP TRIGGER TRI_place_id;
DROP TRIGGER TRI_place_photo_id;



/* Drop Tables */

DROP TABLE blocking CASCADE CONSTRAINTS;
DROP TABLE review CASCADE CONSTRAINTS;
DROP TABLE booking CASCADE CONSTRAINTS;
DROP TABLE place_photo CASCADE CONSTRAINTS;
DROP TABLE place CASCADE CONSTRAINTS;
DROP TABLE member CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_blocking_id;
DROP SEQUENCE SEQ_booking_id;
DROP SEQUENCE SEQ_member_id;
DROP SEQUENCE SEQ_place_id;
DROP SEQUENCE SEQ_place_photo_id;




/* Create Sequences */

CREATE SEQUENCE SEQ_blocking_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_booking_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_member_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_place_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_place_photo_id INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE blocking
(
	id number NOT NULL,
	place_id number,
	blocking_date date,
	PRIMARY KEY (id)
);


CREATE TABLE booking
(
	id number NOT NULL,
	place_id number,
	member_id number,
	check_in_date date,
	check_out_date date,
	payment number,
	booking_date date,
	cancellation_date date,
	refund number,
	PRIMARY KEY (id)
);


CREATE TABLE member
(
	id number NOT NULL,
	email varchar2(50) UNIQUE,
	password varchar2(100),
	first_name varchar2(60),
	last_name varchar2(30),
	birth_date date,
	phone_number varchar2(20),
	registration_date date,
	profile_photo_path varchar2(100),
	PRIMARY KEY (id)
);


CREATE TABLE place
(
	id number NOT NULL,
	member_id number,
	name varchar2(150),
	description varchar2(1500),
	description_etc varchar2(1500),
	type char(1),
	room_type char(1),
	capacity number,
	room_count number,
	bed_count number,
	bathroom_count number,
	address varchar2(200),
	latitude number,
	longitude number,
	is_tv char(1),
	is_wifi char(1),
	is_air_conditioner char(1),
	is_air_purifier char(1),
	is_hair_dryer char(1),
	is_iron char(1),
	is_kitchen char(1),
	is_washing_machine char(1),
	is_elevator char(1),
	is_parking_lot char(1),
	minimum_stay number,
	maximum_stay number,
	price number,
	creation_date date,
	modification_date date,
	PRIMARY KEY (id)
);


CREATE TABLE place_photo
(
	id number NOT NULL,
	place_id number,
	place_photo_path varchar2(100),
	PRIMARY KEY (id)
);


CREATE TABLE review
(
	booking_id number NOT NULL,
	rating number(2,1),
	content varchar2(1500),
	creation_date date,
	PRIMARY KEY (booking_id)
);



/* Create Foreign Keys */

ALTER TABLE review
	ADD FOREIGN KEY (booking_id)
	REFERENCES booking (id)
;


ALTER TABLE booking
	ADD FOREIGN KEY (member_id)
	REFERENCES member (id)
;


ALTER TABLE place
	ADD FOREIGN KEY (member_id)
	REFERENCES member (id)
;


ALTER TABLE blocking
	ADD FOREIGN KEY (place_id)
	REFERENCES place (id)
;


ALTER TABLE booking
	ADD FOREIGN KEY (place_id)
	REFERENCES place (id)
;


ALTER TABLE place_photo
	ADD FOREIGN KEY (place_id)
	REFERENCES place (id)
;



/* Create Triggers */

CREATE OR REPLACE TRIGGER TRI_blocking_id BEFORE INSERT ON blocking
FOR EACH ROW
BEGIN
	SELECT SEQ_blocking_id.nextval
	INTO :new.id
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_booking_id BEFORE INSERT ON booking
FOR EACH ROW
BEGIN
	SELECT SEQ_booking_id.nextval
	INTO :new.id
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_member_id BEFORE INSERT ON member
FOR EACH ROW
BEGIN
	SELECT SEQ_member_id.nextval
	INTO :new.id
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_place_id BEFORE INSERT ON place
FOR EACH ROW
BEGIN
	SELECT SEQ_place_id.nextval
	INTO :new.id
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_place_photo_id BEFORE INSERT ON place_photo
FOR EACH ROW
BEGIN
	SELECT SEQ_place_photo_id.nextval
	INTO :new.id
	FROM dual;
END;

/




