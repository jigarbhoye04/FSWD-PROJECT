/*

OBJECT_NAME
---------------------------
PLAYERS
TITLE_SPONSOR
TEAMOWNER
HEADCOACH
TEAMS
UMPIRE
STADIUM
MATCH
UMPIRED_BY
IPL
TEAMDETAILS
YEARWISEPLAYERDETAILS
PLAYED

13 rows selected.


--------------------------------------------------------------------------------
                            --STRUCTURE OF TABLES--
--------------------------------------------------------------------------------


SQL> desc players;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 PLAYERID                                  NOT NULL CHAR(5)
 NAME                                      NOT NULL VARCHAR2(30)
 NATIONALITY                               NOT NULL VARCHAR2(30)
 DOB                                       NOT NULL DATE
 ROLE                                               VARCHAR2(20)
 STRIKERATE                                         NUMBER(5,2)
 BOWLINGSTYLE                                       VARCHAR2(30)
 BATTINGSTYLE                                       VARCHAR2(30)

SQL> desc title_sponsor;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 COMPANYNAME                               NOT NULL VARCHAR2(30)
 BUSSINESSDOMAIN                           NOT NULL VARCHAR2(30)
 COUNTRY                                   NOT NULL VARCHAR2(30)

SQL> desc teamowner;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 COMPANYNAME                               NOT NULL VARCHAR2(30)
 BUSSINESSDOMAIN                           NOT NULL VARCHAR2(30)
 COUNTRY                                   NOT NULL VARCHAR2(30)

SQL> desc headcoach;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 COACHID                                   NOT NULL CHAR(5)
 COACHNAME                                 NOT NULL VARCHAR2(30)
 YEARS_OF_EXPERIENCE                                NUMBER(38)
 DOB                                       NOT NULL DATE
 COUNTRY                                   NOT NULL VARCHAR2(30)

SQL> desc teams;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 TEAMID                                    NOT NULL VARCHAR2(5)
 TEAMNAME                                  NOT NULL VARCHAR2(30)
 OWNERCOMPANY                              NOT NULL VARCHAR2(30)

SQL> desc umpire;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 UMPIREID                                  NOT NULL CHAR(5)
 NAME                                      NOT NULL VARCHAR2(30)
 YEARSOFEXPERIENCE                                  NUMBER(38)
 COUNTRY                                   NOT NULL VARCHAR2(30)

SQL> desc stadium;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 STADIUMNAME                               NOT NULL VARCHAR2(30)
 CITY                                      NOT NULL VARCHAR2(30)
 COUNTRY                                   NOT NULL VARCHAR2(30)
 CAPACITY                                           NUMBER(38)
 RENTAMOUNT                                         NUMBER(38)

SQL> desc match;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 MATCHID                                   NOT NULL VARCHAR2(7)
 MATCHTYPE                                 NOT NULL VARCHAR2(10)
 Date                                      NOT NULL DATE
 STADIUMNAME                               NOT NULL VARCHAR2(30)
 CITY                                      NOT NULL VARCHAR2(30)
 MANOFTHEMATCH                             NOT NULL CHAR(5)

SQL> desc umpired_by;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 MATCHID                                   NOT NULL VARCHAR2(7)
 UMPIREID                                  NOT NULL CHAR(5)

SQL> desc ipl;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 YEAR                                      NOT NULL NUMBER(38)
 TITLESPONSOR                              NOT NULL VARCHAR2(30)
 MANOFTHESERIES                            NOT NULL CHAR(5)
 CHAMPIONTEAM                              NOT NULL VARCHAR2(5)

SQL> desc teamdetails;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 TEAMID                                    NOT NULL VARCHAR2(5)
 Year                                      NOT NULL NUMBER(38)
 CAPTAINID                                 NOT NULL CHAR(5)
 COACHID                                   NOT NULL CHAR(5)
 SPONSORCOMPANY                            NOT NULL VARCHAR2(50)
 SPONSORAMOUNT                             NOT NULL NUMBER(19)

SQL> desc YEARWISEPLAYERDETAILS;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 PLAYERID                                  NOT NULL CHAR(5)
 Year                                      NOT NULL NUMBER(38)
 TEAMID                                    NOT NULL VARCHAR2(5)
 TOTALWICKETS                                       NUMBER(38)
 TOTALRUNS                                          NUMBER(38)
 MAXIMUMWICKETS                                     NUMBER(38)
 MAXIMUMWICKETSRUNS                                 NUMBER(38)
 MAXIMUMRUNS                                        NUMBER(38)
 PLAYERPRICE                                        NUMBER(19)
 OUT_NOTOUT                                         CHAR(1)

SQL> desc played;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 MATCHID                                   NOT NULL VARCHAR2(7)
 TEAMID                                    NOT NULL VARCHAR2(5)
 TEAMRUNS                                  NOT NULL NUMBER(38)
 4s                                        NOT NULL NUMBER(38)
 6s                                        NOT NULL NUMBER(38)
 WICKETS                                   NOT NULL NUMBER(38)
 WINNER                                    NOT NULL CHAR(1)

SQL>
*/

CREATE TABLE Players(
    PlayerID CHAR(5) PRIMARY KEY,
    Name VARCHAR(30) NOT NULL, 
    Nationality VARCHAR(30) NOT NULL,
    DoB DATE NOT NULL,
    Role VARCHAR(30),
    StrikeRate DECIMAL(5,2),
    BowlingStyle VARCHAR(30),
    BattingStyle VARCHAR(30)
);

CREATE TABLE Title_Sponsor(
    CompanyName VARCHAR(30) PRIMARY KEY,
    BusinessDomain VARCHAR(30) NOT NULL,
    Country VARCHAR(30) NOT NULL  
);

CREATE TABLE TeamOwner(
    CompanyName VARCHAR(30) PRIMARY KEY,
    BusinessDomain VARCHAR(30) NOT NULL,
    Country VARCHAR(30) NOT NULL  
);

CREATE TABLE HeadCoach(
    CoachID CHAR(5) PRIMARY KEY,
    CoachName VARCHAR(30) NOT NULL,
    Years_of_Experience INT,
    DoB DATE NOT NULL,
    Country VARCHAR(30) NOT NULL
);

CREATE TABLE Teams(
    TeamID VARCHAR(5) PRIMARY KEY,
    TeamName VARCHAR(30) UNIQUE NOT NULL,
    OwnerCompany VARCHAR(30) NOT NULL,
    FOREIGN KEY(OwnerCompany) REFERENCES TeamOwner(CompanyName)
        ON DELETE CASCADE
);

CREATE TABLE Umpire(
    UmpireID CHAR(5) PRIMARY KEY,
    Name VARCHAR(30) NOT NULL,
    YearsOfExperience INT,
    Country VARCHAR(30) NOT NULL   
);

CREATE TABLE Stadium(
    StadiumName VARCHAR(30),
    City VARCHAR(30),
    Country VARCHAR(30) NOT NULL,
    Capacity INT,
    RentAmount INT,
    PRIMARY KEY (StadiumName, City)
);

CREATE TABLE  Match(
    MatchID VARCHAR(7) PRIMARY KEY,
    MatchType VARCHAR(10) NOT NULL,
    "Date" DATE NOT NULL,
    StadiumName VARCHAR(30) NOT NULL,
    City VARCHAR(30) NOT NULL,
    ManOfTheMatch CHAR(5) NOT NULL,
    FOREIGN KEY (StadiumName, City) REFERENCES Stadium(StadiumName, City)
        ON DELETE CASCADE,
    FOREIGN KEY (ManOfTheMatch) REFERENCES Players(PlayerID)
        ON DELETE CASCADE 
);

CREATE TABLE Umpired_By(
    MatchID VARCHAR(7),
    UmpireID CHAR(5),
    PRIMARY KEY (MatchID, UmpireID),
    FOREIGN KEY (MatchID) REFERENCES  Match(MatchID)
        ON DELETE CASCADE,
    FOREIGN KEY (UmpireID) REFERENCES Umpire(UmpireID)
        ON DELETE CASCADE
);

CREATE TABLE IPL(
    Year INT PRIMARY KEY, 
    TitleSponsor VARCHAR(30) NOT NULL,
    ManOfTheSeries CHAR(5) NOT NULL,
    ChampionTeam VARCHAR(5) NOT NULL,
    FOREIGN KEY (ChampionTeam) REFERENCES Teams(TeamID)
        ON DELETE CASCADE,
    FOREIGN KEY (TitleSponsor) REFERENCES TitleSponsor(CompanyName)
        ON DELETE CASCADE,
    FOREIGN KEY (ManOfTheSeries) REFERENCES Players(PlayerID)
        ON DELETE CASCADE
);

CREATE TABLE TeamDetails(
    TeamID VARCHAR(5),
    "Year" INT,
    CaptainID CHAR(5) NOT NULL,
    CoachID CHAR(5) NOT NULL,
    SponsorCompany VARCHAR(30) NOT NULL,
    SponsorAmount BIGINT NOT NULL,    
    PRIMARY KEY (TeamID, "Year"),
    FOREIGN KEY (CaptainID) REFERENCES Players(PlayerID)
        ON DELETE CASCADE,
    FOREIGN KEY (CoachID) REFERENCES HeadCoach(CoachID)
        ON DELETE CASCADE,
    FOREIGN KEY (SponsorCompany) REFERENCES TitleSponsor(CompanyName)
        ON DELETE CASCADE,
    FOREIGN KEY (TeamID) REFERENCES Teams(TeamID)
        ON DELETE CASCADE,
    FOREIGN KEY ("Year") REFERENCES IPL(Year)
        ON DELETE CASCADE
);

CREATE TABLE YearwisePlayerDetails(
    PlayerID CHAR(5),
    "Year" SMALLINT, 
    TeamID VARCHAR(5) NOT NULL,
    TotalWickets INT,
    TotalRuns INT,
    MaximumWickets INT,
    MaximumWicketsRuns INT,
    MaximumRuns INT,
    PlayerPrice NUMBER(19,0),
    Out_NotOut char(1),
    PRIMARY KEY(PlayerID,"Year"),
    FOREIGN KEY (PlayerID) REFERENCES Players(PlayerID)
        ON DELETE CASCADE,
    FOREIGN KEY (TeamID,"Year") REFERENCES TeamDetails(TeamID)
        ON DELETE CASCADE
);

CREATE TABLE Played(
    MatchID VARCHAR(7),
    TeamID VARCHAR(5),
    TeamRuns INT NOT NULL,
    "4s" INT NOT NULL,
    "6s" INT NOT NULL,
    Wickets INT NOT NULL,
    Winner CHAR(1) NOT NULL,
    PRIMARY KEY(MatchID,TeamID),
    FOREIGN KEY (TeamID) REFERENCES Teams(TeamID)
        ON DELETE CASCADE,
    FOREIGN KEY (MatchID) REFERENCES Match(MatchID)
        ON DELETE CASCADE
);


/*<-------------------------------------------------------------------------------------------->

                                        DATA INSERTION

<-------------------------------------------------------------------------------------------->*/

INSERT INTO Players VALUES ('00001','Hardik Pandya','India',TO_DATE('1993-10-11','YYYY-MM-DD'),'All-rounder',146.33,'right-arm fast-medium','right-handed');
INSERT INTO Players VALUES ('00002','Rashid Khan','Afghanistan',TO_DATE('1998-09-20','YYYY-MM-DD'),'All-rounder',154.29,'light-arm legbreak','right-handed');
INSERT INTO Players VALUES ('00003','David Miller','South Africa',TO_DATE('1988-06-10','YYYY-MM-DD'),'Batsman',137.89,'right-arm offbreak','left-handed');
INSERT INTO Players VALUES ('00004','Vijay Shankar','India',TO_DATE('1991-01-26','YYYY-MM-DD'),'All-rounder',127.44,'right-arm medium','right-handed');
INSERT INTO Players VALUES ('00005','Shubman Gill','India',TO_DATE('1999-09-08','YYYY-MM-DD'),'Batsman',126.67,'right-arm offbreak','right-handed');
INSERT INTO Players VALUES ('00006','Rahul Tewatia','India',TO_DATE('1993-05-20','YYYY-MM-DD'),'All-rounder',130.19,'right-arm legbreak','left-handed');
INSERT INTO Players VALUES ('00007','Wridddhiman Saha','India',TO_DATE('1984-10-24','YYYY-MM-DD'),'Wicketkeeper',128.42,NULL,'right-handed');
INSERT INTO Players VALUES ('00008','Mohammad Shami','India',TO_DATE('1990-09-03','YYYY-MM-DD'),'Bowler',94.52,'right-arm fast-medium','right-handed');
INSERT INTO Players VALUES ('00009','Mohit Sharma','India',TO_DATE('1988-09-18','YYYY-MM-DD'),'Bowler',104.27,'right-arm fast-medium','right-handed');
INSERT INTO Players VALUES ('00010','Alzarri Joseph','Jamaica',TO_DATE('1996-11-20','YYYY-MM-DD'),'Bowler',100,'right-arm fast-medium','right-handed');
INSERT INTO Players VALUES ('00011','Kane Williamson','New Zealand',TO_DATE('1990-08-08','YYYY-MM-DD'),'Batsman',113.19,'right-arm offbreak','right-handed');
INSERT INTO Players VALUES ('00012','M S Dhoni','India',TO_DATE('1981-07-07','YYYY-MM-DD'),'Wicketkeeper',135.77,'right-arm medium','right-handed');
INSERT INTO Players VALUES ('00013','Ravindra Jadeja','India',TO_DATE('1988-12-06','YYYY-MM-DD'),'Bowler',127.62,'left-arm orthodox','left-handed');
INSERT INTO Players VALUES ('00014','Suresh Raina','India',TO_DATE('1986-11-27','YYYY-MM-DD'),'Batsman',136.73,'right-arm offbreak','left-handed');
INSERT INTO Players VALUES ('00015','Cheteshwar Pujara','India',TO_DATE('1988-01-23','YYYY-MM-DD'),'Batsman',99.74,'right-arm legbreak','right-handed');
INSERT INTO Players VALUES ('00016','Deepak Chahar','India',TO_DATE('1992-07-07','YYYY-MM-DD'),'Bowler',138.6,'right-arm medium','right-handed');
INSERT INTO Players VALUES ('00017','Mitchell Santner','New Zealand',TO_DATE('1992-02-05','YYYY-MM-DD'),'All-rounder',103.7,'left-arm orthodox','left-handed');
INSERT INTO Players VALUES ('00018','Dwayne Bravo','Jamaica',TO_DATE('1983-10-07','YYYY-MM-DD'),'Batsman',129.57,'right-arm fast-medium','right-handed');
INSERT INTO Players VALUES ('00019','Shardul Thakur','India',TO_DATE('1991-12-16','YYYY-MM-DD'),'Bowler',148.11,'right-arm fast-medium','right-handed');
INSERT INTO Players VALUES ('00020','Imran Tahir','South Africa',TO_DATE('1979-03-27','YYYY-MM-DD'),'Bowler',89.19,'right-arm legbreak','right-handed');
INSERT INTO Players VALUES ('00021','Moeen Ali','England',TO_DATE('1987-06-18','YYYY-MM-DD'),'Batsman',143.61,'right-arm offbreak','left-handed');
INSERT INTO Players VALUES ('00022','Faf Du Plesis','South Africa',TO_DATE('1984-07-13','YYYY-MM-DD'),'Batsman',132.87,'right-arm legbreak','right-handed');
INSERT INTO Players VALUES ('00023','Virat Kohli','India',TO_DATE('1988-11-05','YYYY-MM-DD'),'Batsman',129.67,'right-arm medium','right-handed');
INSERT INTO Players VALUES ('00024','Rajat Patidar','India',TO_DATE('1993-06-01','YYYY-MM-DD'),'Batsman',144.29,'right-arm offbreak','right-handed');
INSERT INTO Players VALUES ('00025','Devdutt Padikal','India',TO_DATE('2000-07-07','YYYY-MM-DD'),'Batsman',123.01,'right-arm offbreak','left-handed');
INSERT INTO Players VALUES ('00026','Glenn Maxwell','Australia',TO_DATE('1988-10-14','YYYY-MM-DD'),'All-rounder',150.98,'right-arm offbreak','right-handed');
INSERT INTO Players VALUES ('00027','Tim David','Singapore',TO_DATE('1996-03-16','YYYY-MM-DD'),'All-rounder',179.74,'right-arm medium','right-handed');
INSERT INTO Players VALUES ('00028','Shahbaz Ahmed','India',TO_DATE('1994-12-11','YYYY-MM-DD'),'All-rounder',119.08,'left-arm orthodox','left-handed');
INSERT INTO Players VALUES ('00029','AB de Villiers','South Africa',TO_DATE('1984-02-17','YYYY-MM-DD'),'Wicketkeeper',151.69,'right-arm medium','right-handed');
INSERT INTO Players VALUES ('00030','Mohammed Siraj','India',TO_DATE('1994-03-13','YYYY-MM-DD'),'Bowler',88.07,'right-arm fast-medium','right-handed');
INSERT INTO Players VALUES ('00031','Navdeep Saini','India',TO_DATE('1992-11-23','YYYY-MM-DD'),'Bowler',88.19,'right-arm fast','right-handed');
INSERT INTO Players VALUES ('00032','Yuzvendra Chahal','India',TO_DATE('1990-07-23','YYYY-MM-DD'),'Bowler',43.02,'right-arm legbreak','right-handed');
INSERT INTO Players VALUES ('00033','Srikar Bharat','India',TO_DATE('1993-10-03','YYYY-MM-DD'),'Batsman',122.07,NULL,'right-handed');
INSERT INTO Players VALUES ('00034','Rohit Sharma','India',TO_DATE('1987-04-30','YYYY-MM-DD'),'Batsman',130.07,'right-arm offbreak','right-handed');
INSERT INTO Players VALUES ('00035','Suryakumar Yadav','India',TO_DATE('1990-09-14','YYYY-MM-DD'),'Batsman',136.87,'right-arm offbreak','right-handed');
INSERT INTO Players VALUES ('00036','Chris Lynn','Australia',TO_DATE('1990-04-10','YYYY-MM-DD'),'Batsman',140.63,'left-arm orthodox','right-handed');
INSERT INTO Players VALUES ('00037','Krunal Pandya','India',TO_DATE('1991-03-24','YYYY-MM-DD'),'All-rounder',135.71,'left-arm orthodox','left-handed');
INSERT INTO Players VALUES ('00038','Kieron Pollard','Jamaica',TO_DATE('1987-05-12','YYYY-MM-DD'),'All-rounder',147.32,'right-arm medium','right-handed');
INSERT INTO Players VALUES ('00039','James Neesham','New Zealand',TO_DATE('1990-09-17','YYYY-MM-DD'),'All-rounder',98.92,'right-arm medium','left-handed');
INSERT INTO Players VALUES ('00040','Quinton de Kock','South Africa',TO_DATE('1992-12-17','YYYY-MM-DD'),'Wicketkeeper',133.91,NULL,'left-handed');
INSERT INTO Players VALUES ('00041','Ishan Kishan','India',TO_DATE('1998-07-18','YYYY-MM-DD'),'Wicketkeeper',133.36,NULL,'left-handed');
INSERT INTO Players VALUES ('00042','Jasprit Bumrah','India',TO_DATE('1993-12-06','YYYY-MM-DD'),'Bowler',84.85,'right-arm fast','right-handed');
INSERT INTO Players VALUES ('00043','Nathan Coulter-Nile','Australia',TO_DATE('1987-10-11','YYYY-MM-DD'),'Bowler',113.89,'right-arm fast','right-handed');
INSERT INTO Players VALUES ('00044','Rahul Chahar','India',TO_DATE('1999-08-04','YYYY-MM-DD'),'Bowler',100,'right-arm legbreak','right-handed');
INSERT INTO Players VALUES ('00045','Eoin Morgan','England',TO_DATE('1986-09-10','YYYY-MM-DD'),'Batsman',122.6,'right-arm medium','left-handed');
INSERT INTO Players VALUES ('00046','Andre Russell','Jamaica',TO_DATE('1988-04-29','YYYY-MM-DD'),'All-rounder',177.09,'right-arm fast','right-handed');
INSERT INTO Players VALUES ('00047','Venkatesh Iyer','India',TO_DATE('1994-12-25','YYYY-MM-DD'),'All-rounder',132.32,'right-arm medium','left-handed');
INSERT INTO Players VALUES ('00048','Shakib Al Hasan','Bangladesh',TO_DATE('1987-03-24','YYYY-MM-DD'),'Batsman',124.49,'left-arm orthodox','left-handed');
INSERT INTO Players VALUES ('00049','Dinesh Karthik','India',TO_DATE('1985-06-01','YYYY-MM-DD'),'Wicketkeeper',132.71,NULL,'right-handed');
INSERT INTO Players VALUES ('00050','Sheldon Jackson','India',TO_DATE('1986-09-27','YYYY-MM-DD'),'Batsman',NULL,NULL,'right-handed');
INSERT INTO Players VALUES ('00051','Harbhajan Singh','India',TO_DATE('1980-07-03','YYYY-MM-DD'),'Bowler',137.91,'right-arm offbreak','right-handed');
INSERT INTO Players VALUES ('00052','Kuldeep Yadav','India',TO_DATE('1994-12-14','YYYY-MM-DD'),'Bowler',80.26,'left-arm chinaman','left-handed');
INSERT INTO Players VALUES ('00053','Lockie Ferguson','New Zealand',TO_DATE('1991-06-13','YYYY-MM-DD'),'Bowler',148.89,'right-arm fast','right-handed');
INSERT INTO Players VALUES ('00054','Sunil Narine','Jamaica',TO_DATE('1983-05-26','YYYY-MM-DD'),'Bowler',162.32,'right-arm offbreak','left-handed');
INSERT INTO Players VALUES ('00055','Nitish Rana','India',TO_DATE('1993-12-27','YYYY-MM-DD'),'Batsman',134.97,'right-arm offbreak','left-handed');
INSERT INTO Players VALUES ('00056','Shimron Hetmyer','Guyana',TO_DATE('1996-12-26','YYYY-MM-DD'),'Batsman',156.31,NULL,'left-handed');
INSERT INTO Players VALUES ('00057','Joe Root','England',TO_DATE('1990-12-30','YYYY-MM-DD'),'Batsman',NULL,'right-arm offbreak','right-handed');
INSERT INTO Players VALUES ('00058','Ravichandran Ashwin','India',TO_DATE('1986-09-17','YYYY-MM-DD'),'All-rounder',118.52,'right-arm offbreak','right-handed');
INSERT INTO Players VALUES ('00059','Jason Holder','Barbados',TO_DATE('1991-11-05','YYYY-MM-DD'),'Bowler',123.38,'right-arm fast-medium','right-handed');
INSERT INTO Players VALUES ('00060','Sanju Samson','India',TO_DATE('1994-11-11','YYYY-MM-DD'),'Wicketkeeper',136.63,NULL,'right-handed');
INSERT INTO Players VALUES ('00061','Jos Buttler','England',TO_DATE('1990-09-08','YYYY-MM-DD'),'Batsman',150.49,NULL,'right-handed');
INSERT INTO Players VALUES ('00062','Trent Boult','New Zealand',TO_DATE('1989-07-22','YYYY-MM-DD'),'Bowler',108.16,'left-arm fast-medium','right-handed');
INSERT INTO Players VALUES ('00063','Sandeep Sharma','India',TO_DATE('1993-05-18','YYYY-MM-DD'),'Bowler',81.25,'right-arm fast-medium','right-handed');
INSERT INTO Players VALUES ('00064','Adam Zampa','Australia',TO_DATE('1992-03-31','YYYY-MM-DD'),'Bowler',66.67,'right-arm legbreak','right-handed');
INSERT INTO Players VALUES ('00065','Chris Gayle','Jamaica',TO_DATE('1979-09-21','YYYY-MM-DD'),'Batsman',189.65,'right-arm fast-medium','left-handed');
INSERT INTO Players VALUES ('00066','Vishwaraj Vedantam','Sri Lanka',TO_DATE('1999-01-22','YYYY-MM-DD'),'Wicketkeeper',102.24,'left-arm fast-medium','right-handed');






INSERT INTO TitleSponsor VALUES ('Vivo Mobile Pvt Ltd','Smartphone Company','China');
INSERT INTO TitleSponsor VALUES ('Star Sports Network','Television Sports Channel Company','India');
INSERT INTO TitleSponsor VALUES ('Dream 11','Fantasy Sports Platform','India');
INSERT INTO TitleSponsor VALUES ('PhonePe','Financial Technology and Payments Company','India');
INSERT INTO TitleSponsor VALUES ('Myntra','Fashion E-Commerce Company','India');
INSERT INTO TitleSponsor VALUES ('Aircel','Mobile Network Operator','India');
INSERT INTO TitleSponsor VALUES ('Muthoot Finance Ltd','Financial Corporation','India');
INSERT INTO TitleSponsor VALUES ('DHFL','Housing Finance Company','India');
INSERT INTO TitleSponsor VALUES ('Colors','General Entertainment Broadcast Company','India');
INSERT INTO TitleSponsor VALUES ('Puma','Athletic Footwear, Apparels and Accessories','Germany');
INSERT INTO TitleSponsor VALUES ('MPL','Online Gaming Platform','India');
INSERT INTO TitleSponsor VALUES ('Kingfisher','Alcoholic Beverage Company','India');
INSERT INTO TitleSponsor VALUES ('Swiggy','Online Food Ordering & Delivering Platform','India');
INSERT INTO TitleSponsor VALUES ('Royal Stag','Alcoholic Beverage Company','India');
INSERT INTO TitleSponsor VALUES ('Colgate','Oral Hygiene Product Company','United States of America');
INSERT INTO TitleSponsor VALUES ('Mai Dubai','Food & Bevarage Company','Dubai');
INSERT INTO TitleSponsor VALUES ('Kotak Mahindra Bank','Banking and Financial Services Company','India');
INSERT INTO TitleSponsor VALUES ('Kent RO Systems','Healthcare Products Company','India');







INSERT INTO TeamOwner VALUES ('Red Chillies Entertainment','Film Industry','India');
INSERT INTO TeamOwner VALUES ('Reliance Industry Ltd','Telecommunications, Energy','India');
INSERT INTO TeamOwner VALUES ('CVC Capital Partners','Investment Advisory Firm','England');
INSERT INTO TeamOwner VALUES ('United Spirits','Alcoholic Beverages Company','England');
INSERT INTO TeamOwner VALUES ('Emerging Media IPL Ltd','Digital Venture Builder','England');
INSERT INTO TeamOwner VALUES ('India Cements Ltd','Cement Manufacturing','India');





INSERT INTO HeadCoach VALUES ('10101','Jacques Kallis',10,TO_DATE('1975-10-16','YYYY-MM-DD'),'South Africa');
INSERT INTO HeadCoach VALUES ('10103','Paddy Upton',20,TO_DATE('1968-11-05','YYYY-MM-DD'),'South Africa');
INSERT INTO HeadCoach VALUES ('10104','Gary Kirsten',24,TO_DATE('1967-11-23','YYYY-MM-DD'),'South Africa');
INSERT INTO HeadCoach VALUES ('10105','Mark Boucher',17,TO_DATE('1976-12-03','YYYY-MM-DD'),'South Africa');
INSERT INTO HeadCoach VALUES ('10106','Ashish Nehra',4,TO_DATE('1979-04-29','YYYY-MM-DD'),'India');
INSERT INTO HeadCoach VALUES ('10107','Kumar Sngakkara',2,TO_DATE('1977-12-27','YYYY-MM-DD'),'Sri Lanka');
INSERT INTO HeadCoach VALUES ('10108','Andy Flower',5,TO_DATE('1968-04-28','YYYY-MM-DD'),'Zimbabwe');
INSERT INTO HeadCoach VALUES ('10109','Sanjay Bangar',19,TO_DATE('1972-10-11','YYYY-MM-DD'),'India');
INSERT INTO HeadCoach VALUES ('10110','Chandrakant Pandit',18,TO_DATE('1961-09-30','YYYY-MM-DD'),'India');
INSERT INTO HeadCoach VALUES ('10111','Anil Kumble',27,TO_DATE('1970-12-17','YYYY-MM-DD'),'India');
INSERT INTO HeadCoach VALUES ('10112','Trevor Bayliss',13,TO_DATE('1962-12-21','YYYY-MM-DD'),'Australia');






INSERT INTO Umpire VALUES ('00001','Sundaram Ravi',15,'India');
INSERT INTO Umpire VALUES ('00002','Paul Reiffel',18,'Australia');
INSERT INTO Umpire VALUES ('00003','Nitin Menon',9,'India');
INSERT INTO Umpire VALUES ('00004','Christopher Columbus',25,'New Zealand');
INSERT INTO Umpire VALUES ('00005','Anil Chaudary',10,'India');
INSERT INTO Umpire VALUES ('00006','C. Shamshuddin',20,'India');
INSERT INTO Umpire VALUES ('00007','Arvindra Gohel',9,'USA');
INSERT INTO Umpire VALUES ('00008','Sumukh Chattopadhay',14,'India');
INSERT INTO Umpire VALUES ('00009','Gerard Abood',23,'Australia');
INSERT INTO Umpire VALUES ('00010','Afzal Ahmed',12,'India');





INSERT INTO Teams VALUES ('RCB','Royal Challengers Bangalore','United Spirits');
INSERT INTO Teams VALUES ('MI','Mumbai Indians','Reliance Industry Ltd');
INSERT INTO Teams VALUES ('CSK','Chennai Super Kings','India Cements Ltd');
INSERT INTO Teams VALUES ('GT','Gujarat Titans','CVC Capital Partners');
INSERT INTO Teams VALUES ('RR','Rajasthan Royals','Emerging Media IPL Ltd');
INSERT INTO Teams VALUES ('KKR','Kolkata Knight Riders','Red Chillies Entertainment');






INSERT INTO Stadium VALUES ('Narendra Modi Stadium','Ahmedabad','India',132000,4000000);
INSERT INTO Stadium VALUES ('M.Chinnaswamy Stadium','Bangalore','India',40000,1200000);
INSERT INTO Stadium VALUES ('MA Chidambaram Stadium','Chennai','India',50000,1500000);
INSERT INTO Stadium VALUES ('Dubai International Cricket Stadium','Dubai','UAE',33000,990000);
INSERT INTO Stadium VALUES ('Wankhede Stadium','Mumbai','India',33000,990000);
INSERT INTO Stadium VALUES ('Sawai Mansingh Stadium','Jaipur','India',30000,900000);
INSERT INTO Stadium VALUES ('Arun Jaitley Stadium','New Delhi','India',41000,1230000);
INSERT INTO Stadium VALUES ('Rajiv Gandhi International Cricket Stadium','Hyderabad','India',55000,1650000);
INSERT INTO Stadium VALUES ('Eden Gardens','Kolkata','India',68000,2040000);





INSERT INTO  Match VALUES ('2015001','League','2015-03-27','Wankhede Stadium','Mumbai','00012');
INSERT INTO  Match VALUES ('2015002','League','2015-03-29','Sawai Mansingh Stadium','Jaipur','00057');
INSERT INTO  Match VALUES ('2015003','League','2015-04-02','Arun Jaitley Stadium','New Delhi','00042');
INSERT INTO  Match VALUES ('2015004','League','2015-04-05','Sawai Mansingh Stadium','Jaipur','00020');
INSERT INTO  Match VALUES ('2015005','League','2015-04-07','Arun Jaitley Stadium','New Delhi','00029');
INSERT INTO  Match VALUES ('2015011','Semifinal','2015-04-10','Rajiv Gandhi International Cricket Stadium','Hyderabad','00040');
INSERT INTO  Match VALUES ('2015012','Semifinal','2015-04-12','Narendra Modi Stadium','Ahmedabad','00012');
INSERT INTO  Match VALUES ('2015021','Final','2015-04-16','Narendra Modi Stadium','Ahmedabad','00038');
INSERT INTO  Match VALUES ('2019001','League','2019-03-21','M.Chinnaswamy Stadium','Bangalore','00059');
INSERT INTO  Match VALUES ('2019002','League','2019-03-25','MA Chidambaram','Chennai','00052');
INSERT INTO  Match VALUES ('2019003','League','2019-03-28','Eden Gardens','Kolkata','00039');
INSERT INTO  Match VALUES ('2019004','League','2019-04-02','M.Chinnaswamy Stadium','Bangalore','00017');
INSERT INTO  Match VALUES ('2019005','League','2019-04-04','MA Chidambaram','Chennai','00038');
INSERT INTO  Match VALUES ('2019011','Semifinal','2019-04-10','Dubai International Cricket Stadium','Dubai','00038');
INSERT INTO  Match VALUES ('2019012','Semifinal','2019-04-12','Dubai International Cricket Stadium','Dubai','00009');
INSERT INTO  Match VALUES ('2019021','Final','2019-04-18','Narendra Modi Stadium','Ahmedabad','00036');
INSERT INTO  Match VALUES ('2022001','League','2022-04-15','Eden Gardens','Kolkata','00014');
INSERT INTO  Match VALUES ('2022002','League','2022-04-17','Sawai Mansingh Stadium','Jaipur','00056');
INSERT INTO  Match VALUES ('2022003','League','2022-04-18','Narendra Modi Stadium','Ahmedabad','00010');
INSERT INTO  Match VALUES ('2022004','League','2022-04-19','M.Chinnaswamy Stadium','Bangalore','00025');
INSERT INTO  Match VALUES ('2022005','League','2022-04-20','M.Chinnaswamy Stadium','Bangalore','00027');
INSERT INTO  Match VALUES ('2022006','League','2022-04-22','Wankhede Stadium','Mumbai','00036');
INSERT INTO  Match VALUES ('2022007','League','2022-04-23','Wankhede Stadium','Mumbai','00002');
INSERT INTO  Match VALUES ('2022008','League','2022-04-24','Arun Jaitley Stadium','New Delhi','00059');
INSERT INTO  Match VALUES ('2022009','League','2022-04-25','MA Chidambaram','Chennai','00013');
INSERT INTO  Match VALUES ('2022011','Semifinal','2022-05-01','Dubai International Cricket Stadium','Dubai','00011');
INSERT INTO  Match VALUES ('2022012','Semifinal','2022-05-02','Rajiv Gandhi International Cricket Stadium','Hyderabad','00066');
INSERT INTO  Match VALUES ('2022021','Final','2022-05-07','Narendra Modi Stadium','Ahmedabad','00001');




INSERT INTO UMPIRED_BY VALUES ('2015001','00001');
INSERT INTO UMPIRED_BY VALUES ('2015001','00002');
INSERT INTO UMPIRED_BY VALUES ('2015001','00003');
INSERT INTO UMPIRED_BY VALUES ('2015002','00004');
INSERT INTO UMPIRED_BY VALUES ('2015002','00005');
INSERT INTO UMPIRED_BY VALUES ('2015002','00006');
INSERT INTO UMPIRED_BY VALUES ('2015003','00007');
INSERT INTO UMPIRED_BY VALUES ('2015003','00008');
INSERT INTO UMPIRED_BY VALUES ('2015003','00009');
INSERT INTO UMPIRED_BY VALUES ('2015004','00010');
INSERT INTO UMPIRED_BY VALUES ('2015004','00001');
INSERT INTO UMPIRED_BY VALUES ('2015004','00002');
INSERT INTO UMPIRED_BY VALUES ('2015005','00003');
INSERT INTO UMPIRED_BY VALUES ('2015005','00004');
INSERT INTO UMPIRED_BY VALUES ('2015005','00005');
INSERT INTO UMPIRED_BY VALUES ('2015011','00006');
INSERT INTO UMPIRED_BY VALUES ('2015011','00007');
INSERT INTO UMPIRED_BY VALUES ('2015011','00008');
INSERT INTO UMPIRED_BY VALUES ('2015012','00009');
INSERT INTO UMPIRED_BY VALUES ('2015012','00010');
INSERT INTO UMPIRED_BY VALUES ('2015012','00001');
INSERT INTO UMPIRED_BY VALUES ('2015021','00002');
INSERT INTO UMPIRED_BY VALUES ('2015021','00003');
INSERT INTO UMPIRED_BY VALUES ('2015021','00004');
INSERT INTO UMPIRED_BY VALUES ('2019001','00005');
INSERT INTO UMPIRED_BY VALUES ('2019001','00006');
INSERT INTO UMPIRED_BY VALUES ('2019001','00007');
INSERT INTO UMPIRED_BY VALUES ('2019002','00008');
INSERT INTO UMPIRED_BY VALUES ('2019002','00009');
INSERT INTO UMPIRED_BY VALUES ('2019002','00010');
INSERT INTO UMPIRED_BY VALUES ('2019003','00001');
INSERT INTO UMPIRED_BY VALUES ('2019003','00002');
INSERT INTO UMPIRED_BY VALUES ('2019003','00003');
INSERT INTO UMPIRED_BY VALUES ('2019004','00004');
INSERT INTO UMPIRED_BY VALUES ('2019004','00005');
INSERT INTO UMPIRED_BY VALUES ('2019004','00006');
INSERT INTO UMPIRED_BY VALUES ('2019005','00007');
INSERT INTO UMPIRED_BY VALUES ('2019005','00008');
INSERT INTO UMPIRED_BY VALUES ('2019005','00009');
INSERT INTO UMPIRED_BY VALUES ('2019011','00010');
INSERT INTO UMPIRED_BY VALUES ('2019011','00001');
INSERT INTO UMPIRED_BY VALUES ('2019011','00002');
INSERT INTO UMPIRED_BY VALUES ('2019012','00003');
INSERT INTO UMPIRED_BY VALUES ('2019012','00004');
INSERT INTO UMPIRED_BY VALUES ('2019012','00005');
INSERT INTO UMPIRED_BY VALUES ('2019021','00006');
INSERT INTO UMPIRED_BY VALUES ('2019021','00007');
INSERT INTO UMPIRED_BY VALUES ('2019021','00008');
INSERT INTO UMPIRED_BY VALUES ('2022001','00009');
INSERT INTO UMPIRED_BY VALUES ('2022001','00010');
INSERT INTO UMPIRED_BY VALUES ('2022001','00001');
INSERT INTO UMPIRED_BY VALUES ('2022002','00002');
INSERT INTO UMPIRED_BY VALUES ('2022002','00003');
INSERT INTO UMPIRED_BY VALUES ('2022002','00004');
INSERT INTO UMPIRED_BY VALUES ('2022003','00005');
INSERT INTO UMPIRED_BY VALUES ('2022003','00006');
INSERT INTO UMPIRED_BY VALUES ('2022003','00007');
INSERT INTO UMPIRED_BY VALUES ('2022004','00008');
INSERT INTO UMPIRED_BY VALUES ('2022004','00009');
INSERT INTO UMPIRED_BY VALUES ('2022004','00010');
INSERT INTO UMPIRED_BY VALUES ('2022005','00001');
INSERT INTO UMPIRED_BY VALUES ('2022005','00002');
INSERT INTO UMPIRED_BY VALUES ('2022005','00003');
INSERT INTO UMPIRED_BY VALUES ('2022006','00004');
INSERT INTO UMPIRED_BY VALUES ('2022006','00005');
INSERT INTO UMPIRED_BY VALUES ('2022006','00006');
INSERT INTO UMPIRED_BY VALUES ('2022007','00007');
INSERT INTO UMPIRED_BY VALUES ('2022007','00008');
INSERT INTO UMPIRED_BY VALUES ('2022007','00009');
INSERT INTO UMPIRED_BY VALUES ('2022008','00010');
INSERT INTO UMPIRED_BY VALUES ('2022008','00001');
INSERT INTO UMPIRED_BY VALUES ('2022008','00002');
INSERT INTO UMPIRED_BY VALUES ('2022009','00003');
INSERT INTO UMPIRED_BY VALUES ('2022009','00004');
INSERT INTO UMPIRED_BY VALUES ('2022009','00005');
INSERT INTO UMPIRED_BY VALUES ('2022011','00006');
INSERT INTO UMPIRED_BY VALUES ('2022011','00007');
INSERT INTO UMPIRED_BY VALUES ('2022011','00008');
INSERT INTO UMPIRED_BY VALUES ('2022012','00009');
INSERT INTO UMPIRED_BY VALUES ('2022012','00010');
INSERT INTO UMPIRED_BY VALUES ('2022012','00001');
INSERT INTO UMPIRED_BY VALUES ('2022021','00002');
INSERT INTO UMPIRED_BY VALUES ('2022021','00003');
INSERT INTO UMPIRED_BY VALUES ('2022021','00004');




INSERT INTO IPL VALUES (2015,'Dream 11','00046','MI');
INSERT INTO IPL VALUES (2019,'MPL','00061','MI');
INSERT INTO IPL VALUES (2022,'Vivo Mobile Pvt Ltd','00023','GT');



INSERT INTO teamdetails VALUES ('RCB',2015,'00023','10109','Star Sports Network',980000000);
INSERT INTO teamdetails VALUES ('CSK',2015,'00012','10104','Kent RO Systems',700000000);
INSERT INTO teamdetails VALUES ('RR',2015,'00060','10108','Myntra ',300000000);
INSERT INTO teamdetails VALUES ('MI',2015,'00034','10111','PhonePe',830000000);
INSERT INTO teamdetails VALUES ('KKR',2015,'00045','10107','Aircel',470000000);
INSERT INTO teamdetails VALUES ('RCB',2019,'00023','10101','Muthoot Finance Ltd',230000000);
INSERT INTO teamdetails VALUES ('CSK',2019,'00012','10103','DHFL',610000000);
INSERT INTO teamdetails VALUES ('RR',2019,'00058','10105','Royal Stag',490000000);
INSERT INTO teamdetails VALUES ('MI',2019,'00034','10110','Colors',800000000);
INSERT INTO teamdetails VALUES ('KKR',2019,'00049','10107','Puma',190000000);
INSERT INTO teamdetails VALUES ('RCB',2022,'00023','10101','Kingfisher',980000000);
INSERT INTO teamdetails VALUES ('CSK',2022,'00012','10104','Swiggy',280000000);
INSERT INTO teamdetails VALUES ('RR',2022,'00060','10112','Royal Stag',310000000);
INSERT INTO teamdetails VALUES ('MI',2022,'00034','10111','Colgate',940000000);
INSERT INTO teamdetails VALUES ('KKR',2022,'00049','10106','Mai Dubai',820000000);
INSERT INTO teamdetails VALUES ('GT',2022,'00001','10108','Kotak Mahindra Bank',380000000);




INSERT INTO YearWisePlayerDetails VALUES ('00012',2015,'CSK',4,229,2,45,114,170000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00013',2015,'CSK',0,137,0,29,87,160000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00014',2015,'CSK',4,213,3,25,108,20000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00015',2015,'CSK',6,39,4,36,25,150000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00001',2015,'CSK',3,95,2,8,87,110000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00017',2015,'CSK',0,160,0,31,69,50000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00018',2015,'CSK',6,231,6,28,82,110000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00019',2015,'CSK',8,3,5,15,3,170000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00020',2015,'CSK',5,142,3,11,122,110000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00021',2015,'CSK',1,125,1,14,80,50000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00022',2015,'CSK',8,56,6,17,38,140000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00023',2015,'RCB',5,13,4,42,10,10000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00024',2015,'RCB',1,47,1,34,24,170000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00004',2015,'RCB',6,191,5,14,79,150000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00026',2015,'RCB',3,52,2,30,46,170000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00027',2015,'RCB',7,56,5,50,48,130000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00002',2015,'RCB',5,12,2,43,9,100000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00029',2015,'RCB',5,228,3,26,97,20000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00030',2015,'RCB',6,87,3,29,48,140000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00031',2015,'RCB',4,111,2,32,58,60000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00032',2015,'RCB',4,244,3,15,93,170000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00003',2015,'RCB',6,257,4,24,93,150000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00034',2015,'MI',0,41,0,36,39,100000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00035',2015,'MI',5,209,2,42,105,50000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00036',2015,'MI',0,146,0,29,91,100000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00037',2015,'MI',8,54,6,45,37,60000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00038',2015,'MI',5,15,4,42,14,130000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00039',2015,'MI',5,50,2,45,31,20000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00040',2015,'MI',NULL,251,NULL,NULL,140,80000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00041',2015,'MI',NULL,99,NULL,NULL,73,30000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00042',2015,'MI',1,134,1,14,129,20000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00043',2015,'MI',2,224,1,5,90,20000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00044',2015,'MI',1,68,1,2,42,90000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00045',2015,'KKR',0,94,0,2,56,60000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00046',2015,'KKR',5,81,3,12,55,130000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00047',2015,'KKR',3,217,2,22,131,10000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00048',2015,'KKR',0,106,0,6,91,110000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00049',2015,'KKR',NULL,209,NULL,NULL,88,160000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00050',2015,'KKR',NULL,105,NULL,NULL,61,10000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00051',2015,'KKR',6,260,4,27,101,150000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00052',2015,'KKR',4,164,2,49,58,120000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00053',2015,'KKR',3,49,1,46,26,140000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00054',2015,'KKR',8,65,5,37,53,150000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00055',2015,'KKR',0,194,0,22,88,170000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00056',2015,'RR',NULL,100,NULL,NULL,57,80000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00057',2015,'RR',4,114,3,20,102,90000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00058',2015,'RR',4,123,2,21,84,130000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00059',2015,'RR',8,166,5,25,62,170000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00060',2015,'RR',NULL,35,NULL,NULL,32,20000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00061',2015,'RR',NULL,122,NULL,NULL,73,150000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00062',2015,'RR',3,41,2,47,24,110000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00063',2015,'RR',1,253,1,8,165,80000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00064',2015,'RR',3,255,2,5,125,70000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00065',2015,'RR',2,31,2,0,17,140000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00066',2015,'RR',5,84,3,45,81,70000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00012',2019,'CSK',1,214,1,14,90,40000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00013',2019,'CSK',0,133,0,34,69,10000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00014',2019,'CSK',8,62,5,32,58,80000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00015',2019,'CSK',6,51,4,48,50,80000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00016',2019,'CSK',1,81,1,10,46,140000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00017',2019,'CSK',8,221,6,44,103,170000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00018',2019,'CSK',7,180,3,2,85,30000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00019',2019,'CSK',2,283,1,43,176,30000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00020',2019,'CSK',3,284,1,40,180,80000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00021',2019,'CSK',2,35,2,14,32,40000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00022',2019,'CSK',6,110,2,48,81,90000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00023',2019,'RCB',7,136,5,42,95,100000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00024',2019,'RCB',4,294,3,37,119,30000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00025',2019,'RCB',2,250,1,7,166,120000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00026',2019,'RCB',8,181,4,3,77,50000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00027',2019,'RCB',6,0,4,48,0,120000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00028',2019,'RCB',1,217,1,47,96,70000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00029',2019,'RCB',2,259,2,48,150,90000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00030',2019,'RCB',3,226,2,18,87,20000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00031',2019,'RCB',3,300,3,23,166,130000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00010',2019,'RCB',5,277,3,40,132,140000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00033',2019,'RCB',NULL,92,NULL,NULL,47,110000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00034',2019,'MI',2,153,1,11,63,80000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00035',2019,'MI',3,177,2,29,70,100000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00036',2019,'MI',2,41,2,26,39,10000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00037',2019,'MI',4,239,3,23,94,130000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00038',2019,'MI',8,110,5,23,66,170000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00039',2019,'MI',0,271,0,3,121,20000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00040',2019,'MI',NULL,141,NULL,NULL,116,80000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00041',2019,'MI',NULL,151,NULL,NULL,100,110000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00042',2019,'MI',7,5,3,30,3,60000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00043',2019,'MI',6,114,3,43,76,170000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00044',2019,'MI',8,56,4,8,30,80000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00045',2019,'KKR',0,85,0,16,47,110000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00049',2019,'KKR',NULL,55,NULL,NULL,47,100000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00047',2019,'KKR',4,248,2,29,108,80000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00008',2019,'KKR',0,33,0,33,23,50000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00009',2019,'KKR',2,273,2,3,155,60000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00050',2019,'KKR',NULL,137,NULL,NULL,111,80000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00007',2019,'KKR',NULL,19,NULL,NULL,18,150000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00052',2019,'KKR',7,10,3,47,5,160000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00053',2019,'KKR',3,270,2,33,97,40000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00054',2019,'KKR',7,57,3,34,47,100000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00006',2019,'KKR',0,292,0,26,182,70000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00056',2019,'RR',NULL,245,NULL,NULL,106,110000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00005',2019,'RR',4,190,2,31,74,70000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00058',2019,'RR',7,185,5,0,107,160000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00059',2019,'RR',6,120,5,32,94,80000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00060',2019,'RR',NULL,73,NULL,NULL,45,160000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00061',2019,'RR',NULL,99,NULL,NULL,98,60000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00062',2019,'RR',4,235,3,5,151,120000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00063',2019,'RR',3,263,1,3,124,10000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00064',2019,'RR',4,57,3,30,47,120000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00065',2019,'RR',3,95,2,35,53,30000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00066',2019,'RR',4,68,2,16,39,90000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00001',2022,'GT',5,149,4,41,112,50000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00002',2022,'GT',5,56,3,11,50,120000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00003',2022,'GT',0,148,0,15,142,110000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00004',2022,'GT',7,238,3,2,88,160000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00005',2022,'GT',6,248,2,21,138,150000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00006',2022,'GT',3,246,3,26,107,20000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00007',2022,'GT',NULL,289,NULL,NULL,176,80000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00008',2022,'GT',0,168,0,27,78,70000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00009',2022,'GT',0,214,0,29,140,50000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00010',2022,'GT',6,320,2,29,154,30000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00011',2022,'GT',3,204,1,34,70,170000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00012',2022,'CSK',6,328,2,14,129,40000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00013',2022,'CSK',7,11,3,34,11,40000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00014',2022,'CSK',1,215,1,22,79,60000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00015',2022,'CSK',2,27,1,3,26,40000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00016',2022,'CSK',4,64,2,41,56,90000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00017',2022,'CSK',7,338,6,7,192,160000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00018',2022,'CSK',7,239,3,17,113,10000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00019',2022,'CSK',1,86,1,3,74,120000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00020',2022,'CSK',0,262,0,44,147,160000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00021',2022,'CSK',1,41,1,38,25,100000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00022',2022,'CSK',8,121,3,29,65,170000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00023',2022,'RCB',2,151,1,19,113,140000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00024',2022,'RCB',6,152,4,36,134,100000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00025',2022,'RCB',6,37,5,36,23,130000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00026',2022,'RCB',1,248,1,21,160,80000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00027',2022,'RCB',1,271,1,20,177,130000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00028',2022,'RCB',3,165,1,16,136,170000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00029',2022,'RCB',4,237,2,2,113,120000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00030',2022,'RCB',1,242,1,47,140,160000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00031',2022,'RCB',4,290,3,21,180,90000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00010',2022,'RCB',0,48,0,41,29,20000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00033',2022,'RCB',NULL,149,NULL,NULL,128,170000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00034',2022,'MI',5,53,3,14,45,90000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00035',2022,'MI',8,106,6,40,53,50000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00036',2022,'MI',8,229,2,4,111,120000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00037',2022,'MI',6,246,5,0,106,160000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00038',2022,'MI',3,24,2,21,20,80000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00039',2022,'MI',5,177,4,30,96,120000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00040',2022,'MI',NULL,160,NULL,NULL,139,80000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00041',2022,'MI',NULL,286,NULL,NULL,138,50000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00042',2022,'MI',2,268,2,17,153,70000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00043',2022,'MI',8,102,5,48,51,120000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00044',2022,'MI',8,116,5,7,83,170000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00045',2022,'KKR',6,34,4,44,17,20000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00046',2022,'KKR',0,139,0,42,100,90000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00047',2022,'KKR',5,264,3,24,139,20000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00048',2022,'KKR',0,167,0,14,132,80000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00049',2022,'KKR',NULL,217,NULL,NULL,137,60000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00050',2022,'KKR',NULL,296,NULL,NULL,162,110000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00051',2022,'KKR',4,286,2,23,153,150000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00052',2022,'KKR',2,251,1,9,157,130000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00053',2022,'KKR',2,250,2,35,136,110000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00054',2022,'KKR',3,277,2,12,150,150000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00055',2022,'KKR',5,231,3,6,121,150000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00056',2022,'RR',3,207,2,12,115,170000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00057',2022,'RR',2,209,1,35,122,140000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00058',2022,'RR',3,145,3,19,112,170000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00059',2022,'RR',4,77,4,41,41,60000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00060',2022,'RR',NULL,271,NULL,NULL,150,150000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00061',2022,'RR',NULL,259,NULL,NULL,168,160000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00062',2022,'RR',4,178,3,5,96,150000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00063',2022,'RR',5,65,4,26,51,20000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00064',2022,'RR',8,32,5,8,20,90000000, 0);
INSERT INTO YearWisePlayerDetails VALUES ('00065',2022,'RR',2,164,1,7,117,130000000, 1);
INSERT INTO YearWisePlayerDetails VALUES ('00066',2022,'RR',4,231,3,25,118,110000000, 0);






INSERT INTO played VALUES ('2015001','RR',123,11,2,5,'0');
INSERT INTO played VALUES ('2015001','CSK',125,13,3,7,'1');
INSERT INTO played VALUES ('2015002','RR',180,14,4,5,'1');
INSERT INTO played VALUES ('2015002','RCB',177,11,3,9,'0');
INSERT INTO played VALUES ('2015003','KKR',130,9,3,10,'0');
INSERT INTO played VALUES ('2015003','MI',190,10,6,3,'1');
INSERT INTO played VALUES ('2015004','KKR',213,15,6,9,'0');
INSERT INTO played VALUES ('2015004','CSK',214,12,5,9,'1');
INSERT INTO played VALUES ('2015005','MI',200,16,7,10,'0');
INSERT INTO played VALUES ('2015005','RCB',224,9,6,3,'1');
INSERT INTO played VALUES ('2015011','MI',240,13,6,9,'1');
INSERT INTO played VALUES ('2015011','RR',239,12,7,2,'0');
INSERT INTO played VALUES ('2015012','CSK',145,7,3,8,'1');
INSERT INTO played VALUES ('2015012','RCB',110,4,2,10,'0');
INSERT INTO played VALUES ('2015021','MI',240,18,8,8,'1');
INSERT INTO played VALUES ('2015021','CSK',239,14,4,5,'0');
INSERT INTO played VALUES ('2019001','RR',125,6,3,9,'1');
INSERT INTO played VALUES ('2019001','CSK',123,4,3,2,'0');
INSERT INTO played VALUES ('2019002','RR',76,3,1,10,'0');
INSERT INTO played VALUES ('2019002','KKR',170,6,6,4,'1');
INSERT INTO played VALUES ('2019003','RCB',201,8,6,7,'0');
INSERT INTO played VALUES ('2019003','MI',203,9,5,9,'1');
INSERT INTO played VALUES ('2019004','RCB',189,7,4,2,'0');
INSERT INTO played VALUES ('2019004','CSK',191,9,3,3,'1');
INSERT INTO played VALUES ('2019005','KKR',120,10,2,10,'0');
INSERT INTO played VALUES ('2019005','MI',193,16,4,4,'1');
INSERT INTO played VALUES ('2019011','MI',262,19,7,7,'1');
INSERT INTO played VALUES ('2019011','CSK',261,18,4,6,'0');
INSERT INTO played VALUES ('2019012','RR',90,6,3,10,'0');
INSERT INTO played VALUES ('2019012','KKR',180,13,5,3,'1');
INSERT INTO played VALUES ('2019021','MI',199,13,6,3,'1');
INSERT INTO played VALUES ('2019021','KKR',198,10,4,6,'0');
INSERT INTO played VALUES ('2022001','CSK',212,15,6,7,'1');
INSERT INTO played VALUES ('2022001','KKR',202,9,6,10,'0');
INSERT INTO played VALUES ('2022002','RR',200,6,4,8,'1');
INSERT INTO played VALUES ('2022002','KKR',199,7,6,5,'0');
INSERT INTO played VALUES ('2022003','GT',150,5,3,2,'1');
INSERT INTO played VALUES ('2022003','KKR',60,2,1,10,'0');
INSERT INTO played VALUES ('2022004','GT',144,7,5,6,'0');
INSERT INTO played VALUES ('2022004','RCB',145,5,3,4,'1');
INSERT INTO played VALUES ('2022005','RCB',223,9,7,7,'1');
INSERT INTO played VALUES ('2022005','CSK',178,9,3,10,'0');
INSERT INTO played VALUES ('2022006','MI',195,9,6,4,'1');
INSERT INTO played VALUES ('2022006','RCB',192,8,4,3,'0');
INSERT INTO played VALUES ('2022007','GT',257,14,8,6,'1');
INSERT INTO played VALUES ('2022007','MI',230,11,7,5,'0');
INSERT INTO played VALUES ('2022008','RR',182,10,6,2,'1');
INSERT INTO played VALUES ('2022008','MI',181,8,5,9,'0');
INSERT INTO played VALUES ('2022009','CSK',127,5,4,4,'1');
INSERT INTO played VALUES ('2022009','RR',122,4,3,6,'0');
INSERT INTO played VALUES ('2022011','GT',189,13,6,8,'1');
INSERT INTO played VALUES ('2022011','RCB',142,11,4,10,'0');
INSERT INTO played VALUES ('2022012','RR',216,17,8,3,'1');
INSERT INTO played VALUES ('2022012','CSK',116,6,5,2,'0');
INSERT INTO played VALUES ('2022021','GT',200,16,7,2,'1');
INSERT INTO played VALUES ('2022021','RR',176,7,3,9,'0');

