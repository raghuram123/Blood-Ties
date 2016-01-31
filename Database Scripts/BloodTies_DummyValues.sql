/*SQL Scripts: Blood Ties*/
/**************Insertion of Temp Values in DB*******************************/

/*1. User Info Table*/
use BloodTiesDb
IF EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[UserInfo_Tbl]') AND type in (N'U'))
BEGIN
INSERT INTO UserInfo_Tbl VALUES( 'Smith', 'John', 'password1', 'john_smith@uic.edu', 'UIC S Halsted', 'Chicago', 000000);
INSERT INTO UserInfo_Tbl VALUES( 'Monica', 'Yogeeta', 'password1', 'ykutta2@uic.edu', 'UIC S Halsted', 'Chicago', 000000);
INSERT INTO UserInfo_Tbl VALUES( 'S', 'Raghu', 'password1', 'sraghu@uic.edu', 'UIC S Halsted', 'Chicago', 000000);
INSERT INTO UserInfo_Tbl VALUES( 'A', 'Michael', 'password1', 'amichael@uic.edu', 'UIC S Halsted', 'Chicago', 000000);
INSERT INTO UserInfo_Tbl VALUES( 'T', 'Sneha', 'password1', 'tsneha@uic.edu', 'UIC S Halsted', 'Chicago', 000000);
END


/*2. Illness_LookUp Table*/
 use BloodTiesDb
 IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[Illness_LookUp_Tbl]') AND type in (N'U'))
BEGIN
Insert into illness_lookup_tbl values('COLD');
Insert into illness_lookup_tbl values('FEVER');
Insert into illness_lookup_tbl values('ALCOHOLIC');
Insert into illness_lookup_tbl values('AIDS');
Insert into illness_lookup_tbl values('CANCER');
 END