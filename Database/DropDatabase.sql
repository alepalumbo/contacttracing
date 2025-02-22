-- DROP DATABASE
DELETE FROM Contact;
DELETE FROM Swab;
DELETE FROM Symptoms;
DELETE FROM Infopatient;
DELETE FROM Visit;
DELETE FROM Hospital;
DELETE FROM Presence;
DELETE FROM Patient;
DELETE FROM Loc;
--------------------------------
DROP SEQUENCE seq_loc_pk;
DROP SEQUENCE seq_patient_pk;
DROP SEQUENCE seq_visit_pk;
DROP SEQUENCE seq_swab_pk;
DROP SEQUENCE seq_serological_pk;
DROP SEQUENCE seq_hospital_pk;
DROP SEQUENCE seq_presence_pk;
DROP TABLE CONTACT;
DROP TABLE PRESENCE;
DROP TABLE SWAB;
DROP TABLE SEROLOGICAL;
DROP TABLE SYMPTOMS;
DROP TABLE VISIT;
DROP TABLE HOSPITAL;
DROP TABLE INFOPATIENT;
DROP TABLE PATIENT;
DROP TABLE LOC;