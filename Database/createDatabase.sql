-------------------------TABLES-----------------------------

CREATE TABLE Loc (
        idL     INTEGER,
        City    VARCHAR2(15) NOT NULL,
        Street  VARCHAR2(35) NOT NULL,
        s_Number INTEGER NOT NULL,
        l_Type  CHAR(7) CHECK (l_type IN('Outdoor','Indoor')),
        p_Code  CHAR(5) NOT NULL,
        Nation  CHAR(6) NOT NULL,
            
        CONSTRAINT PK_idL PRIMARY KEY(idL)
);

CREATE TABLE Patient(
        p_Name  VARCHAR2(20) NOT NULL,
        p_Surname VARCHAR2(20) NOT NULL,
        idP     INTEGER,
        b_Date  DATE NOT NULL,
        d_Date  DATE DEFAULT NULL,
        Gender  CHAR(1) CHECK(Gender IN('M','F')),
        Phone   VARCHAR2(10) NOT NULL CHECK (REGEXP_LIKE(Phone,'^((00|\+)39[\. ]??)??3\d{2}[\. ]??\d{6,7}$')),
        eMail   varchar(320) NOT NULL CHECK (REGEXP_LIKE(eMail,'^[A-Za-z]+[A-Za-z0-9.]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$')),
        id_PL    INTEGER,
 
        CONSTRAINT PK_idP PRIMARY KEY(idP),
        CONSTRAINT UQ_eMail UNIQUE(eMail),
        CONSTRAINT UQ_Phone UNIQUE(Phone),
        CONSTRAINT FK_idPL FOREIGN KEY(id_PL) REFERENCES Loc(idL)
	    ON DELETE SET NULL
);

CREATE TABLE Hospital(
        idH INTEGER,
        id_HL INTEGER,
        h_Name VARCHAR2(30) NOT NULL, --mettere unique
        healed INTEGER DEFAULT 0,
        deceased INTEGER DEFAULT 0,
    
        CONSTRAINT PK_H PRIMARY KEY(IdH),
        CONSTRAINT FK_HL FOREIGN KEY(id_HL) REFERENCES Loc(idL)
        ON DELETE SET NULL
);

CREATE TABLE Visit (
        idV   INTEGER,
        date_V  DATE NOT NULL,
        v_Hospital INTEGER NOT NULL,
        id_PV   INTEGER,

        CONSTRAINT PK_idV PRIMARY KEY(idV),
        CONSTRAINT FK_idPV FOREIGN KEY(id_PV) REFERENCES Patient(idp)
        ON DELETE CASCADE,
        CONSTRAINT FK_idHV FOREIGN KEY(v_Hospital) REFERENCES Hospital(idH)
        ON DELETE CASCADE
);

CREATE TABLE Swab(
        id_SW   INTEGER,
        id_VSW  INTEGER,
        Results CHAR(1) DEFAULT 'n' NOT NULL CHECK(Results IN('n','p')),

        CONSTRAINT PK_idSW PRIMARY KEY(id_SW),
        CONSTRAINT FK_idVSW FOREIGN KEY(id_VSW) REFERENCES Visit(idv)
        ON DELETE CASCADE
);

CREATE TABLE Symptoms(
        Fever   NUMBER(1) NOT NULL CHECK (Fever IN (0,1)),
        Cough   NUMBER(1) NOT NULL CHECK (Cough IN (0,1)),
        r_Distress NUMBER(1) NOT NULL CHECK (r_Distress IN (0,1)),
        Fatigue NUMBER(1) NOT NULL CHECK (Fatigue IN (0,1)),
        Severity_l INTEGER AS (Fever+Cough+r_Distress+Fatigue),
        id_SV   INTEGER,

        CONSTRAINT FK_idSV FOREIGN KEY(id_SV) REFERENCES Visit(idV)
        ON DELETE CASCADE
);

CREATE TABLE Serological(
        id_SE   INTEGER,
        id_VSE  INTEGER,
        Results CHAR(8) NOT NULL CHECK(Results IN('negative','igm','igg')),
        
        CONSTRAINT PK_idSE PRIMARY KEY(id_SE),
        CONSTRAINT FK_idVSE FOREIGN KEY(id_VSE) REFERENCES Visit(idV)
        ON DELETE CASCADE
);

CREATE TABLE infoPatient (
        Lockdown NUMBER(1) NOT NULL CHECK (Lockdown IN (0,1)),
        date_Start DATE,
        date_End DATE,
        p_Location CHAR(8) NOT NULL CHECK (p_Location IN ('Ospedale','Casa')),
        id_IP   INTEGER,

        CONSTRAINT FK_idIP FOREIGN KEY (id_IP) REFERENCES Patient(idP)
        ON DELETE CASCADE
);

CREATE TABLE Presence (
        time_Start TIMESTAMP,
        time_End TIMESTAMP,
        p_Mask  NUMBER(1) CHECK (p_Mask IN(0,1)),
        id_PRP  INTEGER NOT NULL,
        id_PRL  INTEGER NOT NULL,
        id_PR INTEGER,

        CONSTRAINT PK_IDPR PRIMARY KEY(id_PR),
        CONSTRAINT FK_idPP FOREIGN KEY(id_PRP) REFERENCES Patient(idP)
        ON DELETE CASCADE,        
        CONSTRAINT FK_idPPL FOREIGN KEY(id_PRL) REFERENCES Loc(idL)
        ON DELETE CASCADE
);

CREATE TABLE Contact (
        id_PR1  INTEGER,
        id_PR2  INTEGER,
        data_C DATE,
        r_Type  CHAR(7) DEFAULT NULL CHECK (r_Type IN ('Amico','Collega','Partner','Parente')),
        Gravity VARCHAR2(5),
        id_PRC1 INTEGER,
        id_PRC2 INTEGER,
        
        CONSTRAINT FK_IRPRC1 FOREIGN KEY(id_PRC1) REFERENCES Presence(id_PR)
        ON DELETE CASCADE,
        CONSTRAINT FK_IRPRC2 FOREIGN KEY(id_PRC2) REFERENCES Presence(id_PR)
        ON DELETE CASCADE,
        CONSTRAINT FK_idPR1 FOREIGN KEY(id_PR1) REFERENCES Patient(idP)
        ON DELETE CASCADE,
        CONSTRAINT FK_IDPR2 FOREIGN KEY(id_PR2) REFERENCES Patient(idP)
        ON DELETE CASCADE

);

CREATE SEQUENCE seq_loc_pk
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER auto_pk_loc
BEFORE INSERT ON Loc
FOR EACH ROW
BEGIN
    :NEW.idL := seq_loc_pk.NEXTVAL;
END;
/

CREATE SEQUENCE seq_patient_pk
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER auto_pk_patient
BEFORE INSERT ON Patient
FOR EACH ROW
BEGIN
    :NEW.idP := seq_patient_pk.NEXTVAL;
END;
/

CREATE SEQUENCE seq_hospital_pk
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER auto_pk_hospital
BEFORE INSERT ON Hospital
FOR EACH ROW
BEGIN
    :NEW.idH := seq_hospital_pk.NEXTVAL;
END;
/


CREATE SEQUENCE seq_visit_pk
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER auto_pk_visit
BEFORE INSERT ON Visit
FOR EACH ROW
BEGIN
    :NEW.idV := seq_visit_pk.NEXTVAL;
END;
/

CREATE SEQUENCE seq_swab_pk
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER auto_pk_swab
BEFORE INSERT ON Swab
FOR EACH ROW
BEGIN
    :NEW.id_SW := seq_swab_pk.NEXTVAL;
END;
/

CREATE SEQUENCE seq_serological_pk
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER auto_pk_serological
BEFORE INSERT ON Serological
FOR EACH ROW
BEGIN
    :NEW.id_SE := seq_serological_pk.NEXTVAL;
END;
/

CREATE SEQUENCE seq_presence_pk
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER auto_pk_presence
BEFORE INSERT ON Presence
FOR EACH ROW
BEGIN
    :NEW.id_Pr := seq_presence_pk.NEXTVAL;
END;
/
-------------------------VIEWS-----------------------------
CREATE OR REPLACE VIEW quarantenacasa AS
SELECT L.City, COUNT(P.idP) QP
FROM Patient P JOIN Visit V ON V.id_PV=P.idP JOIN Hospital H ON V.v_Hospital=H.idH 
JOIN Loc L ON L.idL=H.id_HL JOIN infoPatient I ON P.idP=I.id_IP
WHERE I.Lockdown=1 AND I.p_Location='Casa'
GROUP BY L.City;
------------------------
CREATE OR REPLACE VIEW quarantenaospedale AS
SELECT L.City, COUNT(P.idP) QO
FROM Patient P JOIN Visit V ON V.id_PV=P.idP JOIN Hospital H ON V.v_Hospital=H.idH 
JOIN Loc L ON L.idL=H.id_HL JOIN infoPatient I ON P.idP=I.id_IP
WHERE I.Lockdown=1 AND I.p_Location='Ospedale'
GROUP BY L.City;
------------------------
CREATE OR REPLACE VIEW vhealed AS
SELECT L.City,SUM(H.healed) hh
FROM Hospital H JOIN Loc L ON L.idL=H.id_HL
GROUP BY L.City;
------------------------
CREATE OR REPLACE VIEW vdeceased AS
SELECT L.City, SUM(H.deceased) hd
FROM Hospital H JOIN Loc L ON L.idL=H.id_HL
GROUP BY L.City;
------------------------
CREATE OR REPLACE VIEW totalv AS
SELECT L.City, COUNT(V.idV) QV
FROM Visit V JOIN Hospital H ON V.v_Hospital=H.idH
JOIN Loc L ON L.idL=H.id_HL
GROUP BY L.City;
------------------------
CREATE OR REPLACE VIEW current_s(QuarantenaCasa,QuarantenaOspedale,Deceduti,Guariti,TotaleTest) AS
SELECT 
        (
        SELECT SUM(qp) FROM quarantenacasa
        ),
        (
        SELECT SUM(QO) FROM quarantenaospedale
        ),
		(
         SELECT SUM(hh) FROM vhealed
         ),
        (
        SELECT SUM(hd) FROM vdeceased
        ),
        (
        SELECT SUM(qv) FROM totalv
        )
FROM DUAL;

------------------------

CREATE OR REPLACE VIEW nVisit AS
SELECT V.date_V,V.v_Hospital,V.id_PV,S.Fever,S.Cough,S.r_Distress,S.Fatigue,S.id_SV
FROM Visit V, Symptoms S;

------------------------

CREATE OR REPLACE VIEW Residence AS
SELECT L.City,L.Street,L.s_Number,L.l_type,L.p_code,L.Nation,P.P_Name,P.P_Surname,P.B_Date,P.Gender,P.Phone,P.eMail,P.id_PL
FROM Loc L, Patient P;
------------------------

CREATE OR REPLACE VIEW nHospital AS
SELECT L.City,L.Street,L.s_Number,L.l_type,L.p_code,L.Nation,H.id_HL,H.h_Name
FROM Loc L, Hospital H;

------------------------
CREATE OR REPLACE VIEW Tracking (ID1,NomeDiffusore,CognomeDiffusore,NomeContagiato,ID2,CognomeContagiato,DataContagio,Gravita,Relazione) AS
SELECT C.id_PR1,P1.p_Name,P1.p_Surname,C.id_PR2,P2.p_Name,P2.p_Surname,C.Data_C,C.Gravity,C.R_Type
FROM Contact C JOIN Patient P1 ON C.id_PR1=P1.idP JOIN Patient P2 ON C.id_PR2=P2.idP;

------------------------

CREATE OR REPLACE VIEW v_Presence AS
SELECT Pr.id_PR,P.p_Name,P.p_Surname, Pr.time_Start,Pr.time_End, Pr.p_Mask, L.City, L.Street, L.s_Number
FROM Patient P JOIN Presence Pr ON P.idP=Pr.id_PRP JOIN Loc L ON L.idL=Pr.id_PRL;

-------------------------TRIGGERS-----------------------------

CREATE OR REPLACE TRIGGER same_place
AFTER INSERT ON Swab
FOR EACH ROW
WHEN (NEW.Results = 'p')
DECLARE
    /* Cursore per individuare le tuple relative a tutte le persone che hanno dichiarato di essere presenti in un determinato luogo ad una certa ora
       escluse quelle che sono risultate gia' positive ad un tampone naso-faringeo */
    CURSOR cur1 IS(            
                SELECT *  
                FROM Presence Pr JOIN Patient P ON P.idP=Pr.id_PRP FULL JOIN Contact C ON C.id_prc2=Pr.id_pr OR C.id_prc1=Pr.id_pr
                MINUS
                SELECT *  
                FROM Presence Pr JOIN Patient P ON P.idP=Pr.id_PRP RIGHT JOIN Contact C ON C.id_prc2=Pr.id_pr OR C.id_prc1=Pr.id_pr); 
           
    /* Cursore one-row che individua le informazioni relative al paziente che e' risultato positivo al tampone escluse occorrenze ridondanti relative
       a presenze passate */    
    CURSOR cur2 IS
            (SELECT *  
                FROM Presence Pr JOIN Patient P ON P.idP=Pr.id_PRP FULL JOIN Contact C ON C.id_prc2=Pr.id_pr OR C.id_prc1=Pr.id_pr JOIN Visit V ON P.idP=V.id_PV JOIN Loc L ON L.idL=Pr.id_PRL
                WHERE :NEW.id_VSW = V.idV
                MINUS
                SELECT *  
                FROM Presence Pr JOIN Patient P ON P.idP=Pr.id_PRP RIGHT JOIN Contact C ON C.id_prc2=Pr.id_pr OR C.id_prc1=Pr.id_pr JOIN Visit V ON P.idP=V.id_PV JOIN Loc L ON L.idL=Pr.id_PRL
                WHERE :NEW.id_VSW = V.idV);
             
    np cur2%ROWTYPE;

BEGIN
    FOR curVal IN cur1
    LOOP
        OPEN cur2;
        -- Fetching del cursore relativo al paziente positivo.
        FETCH cur2 INTO np;       
        
        /* Per individuare i pazienti a contatto e inseririli opportunamente nella tabella Contact. Un paziente non puo' mischiare se stesso(curVal.id_PRP<>np.id_PRP), 
           puo' mischiarne un altro solo se quest'ultimo si trova nello stesso luogo (curVal.id_PRL=np.id_PRL) e nello stesso intervallo di tempo nel quale era presente 
           il paziente positivo */
           
		 IF ((curVal.id_PRP<>np.id_PRP) AND (curVal.id_PRL=np.id_PRL) AND 
            ((np.time_Start>=curVal.time_Start AND np.time_Start<=curVal.time_End) OR
            (curVal.time_Start>=np.time_Start AND curVal.time_Start<=np.time_End))) THEN
            -- Nel caso il tipo di luogo sia al chiuso
			IF np.l_type = 'Indoor' THEN
                -- Casi in cui il paziente positivo indossi la mascherina o meno
				IF np.p_mask = 0 THEN
					INSERT INTO Contact(id_PR1,id_PR2,data_C,Gravity,id_PRC1,id_PRC2) VALUES(np.idP, curVal.idP,CAST((curVal.time_start) AS DATE),'Alta',np.id_PR,curVal.id_PR);
				ELSE	
					INSERT INTO Contact(id_PR1,id_PR2,data_C,Gravity,id_PRC1,id_PRC2) VALUES(np.idP, curVal.idP,CAST((curVal.time_start) AS DATE),'Media',np.id_PR,curVal.id_PR);
				END IF;
            -- Nel caso il tipo di luogo sia all'aperto
			ELSE
			-- Casi in cui il paziente positivo indossi la mascherina o meno
            	IF np.p_mask = 1 THEN
					INSERT INTO Contact(id_PR1,id_PR2,data_C,Gravity,id_PRC1,id_PRC2) VALUES(np.idP, curVal.idP,CAST((curVal.time_start) AS DATE),'Bassa',np.id_PR,curVal.id_PR);
				ELSE
					INSERT INTO Contact(id_PR1,id_PR2,data_C,Gravity,id_PRC1,id_PRC2) VALUES(np.idP, curVal.idP,CAST((curVal.time_start) AS DATE),'Media',np.id_PR,curVal.id_PR);
                END IF;
			END IF;
		END IF;
        CLOSE cur2;
        END LOOP;
END;
/

------------------------

CREATE OR REPLACE TRIGGER setQuarantine
AFTER INSERT ON Swab
FOR EACH ROW
WHEN (NEW.Results = 'p')
DECLARE
	s Symptoms.severity_L%TYPE;
	idn Patient.idP%TYPE;
    dt Visit.date_V%TYPE;
BEGIN
	SELECT P.idP, S.severity_L,V.date_V INTO idn,s,dt
	FROM Patient P JOIN Visit V ON idP=id_PV
         JOIN Symptoms S ON V.idV=S.id_SV
         WHERE :NEW.id_VSW = V.idV;	

	IF s >=2 THEN
		INSERT INTO infoPatient VALUES(1,dt,dt+14,'Ospedale',idn);
	ELSE
		INSERT INTO infoPatient VALUES(1,dt,dt,'Casa',idn);
	END IF;
END;
/
------------------------

CREATE OR REPLACE TRIGGER newpatient
INSTEAD OF INSERT ON Residence
FOR EACH ROW
DECLARE
    nl Loc.idL%TYPE;
BEGIN
    INSERT INTO Loc(City,Street,s_Number,l_Type,p_Code,Nation) VALUES(:NEW.City,:NEW.Street,:NEW.s_Number,:NEW.l_type,:NEW.p_code,:NEW.Nation)
    RETURNING idL INTO nl;
    INSERT INTO Patient(p_Name,p_Surname,b_Date,Gender,Phone,eMail,id_PL) VALUES(:NEW.P_Name,:NEW.P_Surname,:NEW.B_Date,:NEW.Gender,:NEW.Phone,:NEW.eMail,nl);
END;
/ 
------------------------

CREATE OR REPLACE TRIGGER newvisit
INSTEAD OF INSERT ON nVisit
FOR EACH ROW
DECLARE
    nv Visit.idV%TYPE;
BEGIN
    INSERT INTO Visit(date_V,v_Hospital,id_PV) VALUES(:NEW.date_V,:NEW.v_Hospital,:NEW.id_PV)
    RETURNING idV INTO nv;
    INSERT INTO Symptoms(Fever,Cough,r_Distress,Fatigue,id_SV) VALUES(:NEW.Fever,:NEW.Cough,:NEW.r_Distress,:NEW.Fatigue,nv);
END;
/

------------------------

CREATE OR REPLACE TRIGGER newhospital
INSTEAD OF INSERT ON nHospital
FOR EACH ROW
DECLARE
    nh Loc.idL%TYPE;
BEGIN
    INSERT INTO Loc(City,Street,s_Number,l_Type,p_Code,Nation) VALUES(:NEW.City,:NEW.Street,:NEW.s_Number,:NEW.l_type,:NEW.p_code,:NEW.Nation)
    RETURNING idL INTO nh;
    INSERT INTO Hospital(id_HL,h_Name) VALUES(nh,:NEW.h_Name);
END;
/



------------------------

CREATE OR REPLACE TRIGGER wrong_date
BEFORE UPDATE ON Patient
FOR EACH ROW
DECLARE
BEGIN   
	IF :NEW.d_Date < :NEW.b_Date THEN
		RAISE_APPLICATION_ERROR(-20111,'Error. Wrong date.');
    END IF;
END;
/
------------------------

CREATE OR REPLACE TRIGGER h_deceased
AFTER UPDATE OF d_Date ON Patient
FOR EACH ROW
WHEN (OLD.d_Date IS NULL)
DECLARE
    hd Hospital.idh%TYPE;
    PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
    SELECT idH INTO hd
    FROM ( SELECT * 
           FROM Visit V JOIN Hospital H ON H.idH=V.v_Hospital
                JOIN Patient P ON V.id_PV=P.idP
           ORDER BY V.idV DESC )
    WHERE ROWNUM = 1;                        

    UPDATE Hospital
    SET deceased = deceased+1
    WHERE idH=hd;
    
    COMMIT;
END;
/

------------------------

CREATE OR REPLACE TRIGGER sw_healed
AFTER INSERT ON Swab
FOR EACH ROW
WHEN (NEW.Results = 'n')
DECLARE
	
	CURSOR cur IS (
        SELECT *
        FROM Patient P JOIN Visit V ON P.idP=V.id_PV JOIN Hospital H ON H.idH=V.v_Hospital
             JOIN Swab Sw ON V.iDV=Sw.id_VSW
       WHERE Sw.Results = 'p'  
    );

	res number := 0;
	hp Patient.idP%TYPE;
    idhc Hospital.idH%TYPE;
    PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
	SELECT P.idP INTO hp
    FROM Patient P JOIN Visit V ON P.idP=V.id_PV
    WHERE :NEW.id_VSW=V.idV;                        

    FOR ch IN cur
    LOOP
        IF ch.idP=hp THEN
	    res := 1;
        idhc := ch.idH;
        EXIT;
	END IF;
    END LOOP;
    
    IF res=1 THEN
        UPDATE Hospital
        SET healed = healed+1
        WHERE idH=idhc;

    	UPDATE infoPatient
        SET Lockdown = 0
        WHERE id_IP=hp;
        
        COMMIT;
    END IF;
END;
/

------------------------

CREATE OR REPLACE TRIGGER se_healed
AFTER INSERT ON Serological
FOR EACH ROW
WHEN (NEW.Results = 'igg' OR NEW.Results = 'Negative')
DECLARE
	
	CURSOR cur IS (
        SELECT *
        FROM ((Patient P JOIN Visit V ON P.idP=V.id_PV) JOIN Hospital H ON H.idH=V.v_Hospital
             JOIN Swab Sw ON V.iDV=Sw.id_VSW)
        WHERE Sw.Results = 'p'
    );

	res number := 0;
	idhc Hospital.idH%TYPE;
	hp Patient.idP%TYPE;
    PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
	SELECT P.idP INTO hp
    FROM Patient P JOIN Visit V ON P.idP=V.id_PV
    WHERE :NEW.id_VSE=V.idV;

    FOR ch IN cur
    LOOP
        IF ch.idP=hp THEN
            res := 1;
            idhc := ch.idH;
	END IF;
    END LOOP;

    IF res=1 THEN

        UPDATE Hospital
        SET healed = healed+1
        WHERE idH=idhc;

    	UPDATE infoPatient
        SET Lockdown = 0
        WHERE id_IP=hp;
        
        COMMIT;
    END IF;

END;
/