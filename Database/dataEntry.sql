-- LOC
INSERT INTO Loc(City,Street,s_Number,l_Type,p_Code,Nation) VALUES('Napoli','Via Napoli',9,'Indoor',80124,'Italia');
INSERT INTO Loc(City,Street,s_Number,l_Type,p_Code,Nation) VALUES('Napoli','Via Marina',10,'Indoor',80121,'Italia');
INSERT INTO Loc(City,Street,s_Number,l_Type,p_Code,Nation) VALUES('Napoli','Via Montagna Spaccata',5,'Indoor',80126,'Italia');
INSERT INTO Loc(City,Street,s_Number,l_Type,p_Code,Nation) VALUES('Roma','Via Del Corso',48,'Indoor',80987,'Italia');
INSERT INTO Loc(City,Street,s_Number,l_Type,p_Code,Nation) VALUES('Roma','Via Cesare',2,'Indoor',80986,'Italia');
INSERT INTO Loc(City,Street,s_Number,l_Type,p_Code,Nation) VALUES('Roma','Corso Italia',2,'Indoor',80986,'Italia');
INSERT INTO Loc(City,Street,s_Number,l_Type,p_Code,Nation) VALUES('Milano','Corso Buenos Aires',33,'Indoor',80032,'Italia');
INSERT INTO Loc(City,Street,s_Number,l_Type,p_Code,Nation) VALUES('Milano','Via Paolo Sarpi',25,'Indoor',80039,'Italia');
INSERT INTO Loc(City,Street,s_Number,l_Type,p_Code,Nation) VALUES('Milano','Corso Italia',3,'Indoor',80039,'Italia');
INSERT INTO Loc(City,Street,s_Number,l_Type,p_Code,Nation) VALUES('Napoli','Piazzale Tecchio',1,'Outdoor',80125,'Italia');
INSERT INTO Loc(City,Street,s_Number,l_Type,p_Code,Nation) VALUES('Napoli','Via Medina',13,'Outdoor',80121,'Italia');
INSERT INTO Loc(City,Street,s_Number,l_Type,p_Code,Nation) VALUES('Napoli','Piazza Sannazzaro',2,'Outdoor',80123,'Italia');
INSERT INTO Loc(City,Street,s_Number,l_Type,p_Code,Nation) VALUES('Napoli','Via Manzoni',58,'Outdoor',80124,'Italia');
INSERT INTO Loc(City,Street,s_Number,l_Type,p_Code,Nation) VALUES('Napoli','Vico Belledonne',9,'Indoor',80121,'Italia');
INSERT INTO Loc(City,Street,s_Number,l_Type,p_Code,Nation) VALUES('Roma','Piazza Del Popolo',20,'Outdoor',80985,'Italia');
INSERT INTO Loc(City,Street,s_Number,l_Type,p_Code,Nation) VALUES('Roma','Viale Trastevere',9,'Indoor',80987,'Italia');
INSERT INTO Loc(City,Street,s_Number,l_Type,p_Code,Nation) VALUES('Milano','Via Porta Romana',22,'Outdoor',80200,'Italia');
INSERT INTO Loc(City,Street,s_Number,l_Type,p_Code,Nation) VALUES('Milano','Via della Moscova',12,'Indoor',80200,'Italia');
COMMIT;

-- PATIENT 
INSERT INTO Patient(p_Name,p_Surname,b_Date,d_Date,Gender,Phone,eMail,id_PL) VALUES('Mario','Mari',TO_DATE('1985-08-05','YYYY-MM-DD'),NULL,'M',323457854,'mariomari@gmail.com',1);
INSERT INTO Patient(p_Name,p_Surname,b_Date,d_Date,Gender,Phone,eMail,id_PL) VALUES('Al','Fonso',TO_DATE('1970-09-01','YYYY-MM-DD'),NULL,'M',3295261234,'alfonso@live.it',2);
INSERT INTO Patient(p_Name,p_Surname,b_Date,d_Date,Gender,Phone,eMail,id_PL) VALUES('Ciro','Esposito',TO_DATE('1994-02-06','YYYY-MM-DD'),NULL,'M',3245681212,'ciro.e@gmail.com',3);
INSERT INTO Patient(p_Name,p_Surname,b_Date,d_Date,Gender,Phone,eMail,id_PL) VALUES('Anna','Donnanna',TO_DATE('2000-01-23','YYYY-MM-DD'),NULL,'F',3332587845,'annadonn@gmail.com',1);
INSERT INTO Patient(p_Name,p_Surname,b_Date,d_Date,Gender,Phone,eMail,id_PL) VALUES('Serena','Pasqua',TO_DATE('1978-07-12','YYYY-MM-DD'),NULL,'F',3401236521,'serena.p@hotmail.com',4);
INSERT INTO Patient(p_Name,p_Surname,b_Date,d_Date,Gender,Phone,eMail,id_PL) VALUES('Elena','Fabrizi',TO_DATE('1935-05-17','YYYY-MM-DD'),NULL,'F',3317742544,'elena.f@live.com',5);
INSERT INTO Patient(p_Name,p_Surname,b_Date,d_Date,Gender,Phone,eMail,id_PL) VALUES('Brambilla','Fumagalli',TO_DATE('1985-08-05','YYYY-MM-DD'),NULL,'M',3384952110,'cadrega@gmail.com',7);

--PRESENCE

INSERT INTO Presence(time_Start,time_End,p_Mask,id_PRP,id_PRL) VALUES(TO_TIMESTAMP('2020-10-02 18:30','YYYY-MM-DD HH24:MI'),(TO_TIMESTAMP('2020-10-02 23:30','YYYY-MM-DD HH24:MI:SS')),0,1,1); --Mario,Anna
INSERT INTO Presence(time_Start,time_End,p_Mask,id_PRP,id_PRL) VALUES(TO_TIMESTAMP('2020-10-02 18:30','YYYY-MM-DD HH24:MI'),(TO_TIMESTAMP('2020-10-02 23:30','YYYY-MM-DD HH24:MI')),0,4,1);
INSERT INTO Presence(time_Start,time_End,p_Mask,id_PRP,id_PRL) VALUES(TO_TIMESTAMP('2020-10-04 10:15','YYYY-MM-DD HH24:MI'),(TO_TIMESTAMP('2020-10-04 12:30','YYYY-MM-DD HH24:MI')),1,4,10); -- Anna,Ciro
INSERT INTO Presence(time_Start,time_End,p_Mask,id_PRP,id_PRL) VALUES(TO_TIMESTAMP('2020-10-04 10:30','YYYY-MM-DD HH24:MI'),(TO_TIMESTAMP('2020-10-04 12:30','YYYY-MM-DD HH24:MI')),1,3,10);
INSERT INTO Presence(time_Start,time_End,p_Mask,id_PRP,id_PRL) VALUES(TO_TIMESTAMP('2020-10-04 11:30','YYYY-MM-DD HH24:MI'),(TO_TIMESTAMP('2020-10-05 12:30','YYYY-MM-DD HH24:MI')),0,3,11); -- Ciro,Serena,Al
INSERT INTO Presence(time_Start,time_End,p_Mask,id_PRP,id_PRL) VALUES(TO_TIMESTAMP('2020-10-05 11:30','YYYY-MM-DD HH24:MI'),(TO_TIMESTAMP('2020-10-05 16:45','YYYY-MM-DD HH24:MI')),0,5,11);
INSERT INTO Presence(time_Start,time_End,p_Mask,id_PRP,id_PRL) VALUES(TO_TIMESTAMP('2020-10-05 15:30','YYYY-MM-DD HH24:MI'),(TO_TIMESTAMP('2020-10-05 17:45','YYYY-MM-DD HH24:MI')),0,2,11);
INSERT INTO Presence(time_Start,time_End,p_Mask,id_PRP,id_PRL) VALUES(TO_TIMESTAMP('2020-10-06 09:30','YYYY-MM-DD HH24:MI'),(TO_TIMESTAMP('2020-10-06 14:00','YYYY-MM-DD HH24:MI')),0,5,15); --Serena,Elena
INSERT INTO Presence(time_Start,time_End,p_Mask,id_PRP,id_PRL) VALUES(TO_TIMESTAMP('2020-10-06 09:30','YYYY-MM-DD HH24:MI'),(TO_TIMESTAMP('2020-10-06 14:00','YYYY-MM-DD HH24:MI')),0,6,15);
COMMIT;

--HOSPITAL
INSERT INTO Hospital(id_HL,h_name) VALUES(1,'Ospedale San Paolo');
INSERT INTO Hospital(id_HL,h_name) VALUES(1,'Ospedale San Leonardo');
INSERT INTO Hospital(id_HL,h_name) VALUES(1,'Ospedale Gemelli');
COMMIT;