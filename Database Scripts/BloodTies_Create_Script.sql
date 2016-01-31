/*SQL Scripts: Blood Ties*/
/**************Creation of Database*******************************/
IF  EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'BloodTiesDb')
DROP DATABASE[BloodTiesDb]

CREATE DATABASE [BloodTiesDb]

/**************Creation of Tables*******************************/
/*1. User Info Table*/
use BloodTiesDb
IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[UserInfo_Tbl]') AND type in (N'U'))
BEGIN

CREATE TABLE UserInfo_Tbl
 (
 UserID int IDENTITY(1,1),
 LastName varchar(255) NOT NULL,
 FirstName varchar(255) NOT NULL,
 Password varchar(255) NOT NULL,
 Email	varchar(400),
 Address varchar(400),
 City varchar(255) NOT NULL,
 PhoneNo int,
 CONSTRAINT PK_TempPKey PRIMARY KEY NONCLUSTERED (UserID), 
 )
 END

 /*2. Illness_LookUp Table*/
 
use BloodTiesDb
 IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[Illness_LookUp_Tbl]') AND type in (N'U'))
BEGIN

CREATE TABLE Illness_LookUp_Tbl
 (
 Illness_ID int IDENTITY(1,1),
 Illnes_Name varchar(500) NOT NULL,
 CONSTRAINT PK_PKey PRIMARY KEY NONCLUSTERED (Illness_ID), 
 )
 END


 /*3. MedicalHistory Table*/
 Use BloodTiesDb;
IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[MedicalHistory_Tbl]') AND type in (N'U'))
BEGIN
CREATE TABLE MedicalHistory_Tbl (
ID int IDENTITY(1,1),
UserID int NOT NULL,
Illness_ID int NOT NULL,
Description TEXT,
DocumentPath TEXT, 
CONSTRAINT PK_TempKey PRIMARY KEY NONCLUSTERED (ID), 
CONSTRAINT FK_UserID FOREIGN KEY (UserID) 
	REFERENCES UserInfo_Tbl(UserID) 
    ON DELETE CASCADE
    ON UPDATE CASCADE,
CONSTRAINT FK_Illness_ID FOREIGN KEY (Illness_ID) 
	REFERENCES Illness_Lookup_Tbl(Illness_ID) 
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
END


 /*4. Personality Mathcing Table*/
Use BloodTiesDb;
IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[Personality_Match_Tbl]') AND type in (N'U'))
BEGIN
CREATE TABLE Personality_Match_Tbl (
ID int IDENTITY(1,1),
UserID int NOT NULL,
Question1 varchar(255) NOT NULL,
Question2 varchar(255) NOT NULL,
Question3 varchar(255) NOT NULL,
Question4 varchar(255) NOT NULL,
Question5 varchar(255) NOT NULL,
CONSTRAINT PK_ID PRIMARY KEY NONCLUSTERED (ID), 
CONSTRAINT FK_UserID1 FOREIGN KEY (UserID) 
	REFERENCES UserInfo_Tbl(UserID) 
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
END

 /*5. Inbox Messages Table*/
Use BloodTiesDb;
IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[Inbox_Messages_Tbl]') AND type in (N'U'))
BEGIN
CREATE TABLE Inbox_Messages_Tbl (
Message_ID int IDENTITY(1,1),
From_UserID int NOT NULL,
To_UserID int NOT NULL,
Message TEXT,
CONSTRAINT PK_MessageID PRIMARY KEY NONCLUSTERED (Message_ID), 
CONSTRAINT FK_From_UserID FOREIGN KEY (From_UserID) 
	REFERENCES UserInfo_Tbl(UserID) 
    ON DELETE CASCADE
    ON UPDATE CASCADE,
CONSTRAINT FK_To_UserID FOREIGN KEY (To_UserID) 
	REFERENCES UserInfo_Tbl(UserID) 
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);
END
