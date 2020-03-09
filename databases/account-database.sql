EXEC sp_execute_external_script
@language = N'python',
@script = N'triage-patient-db.py'

OutputDataSet = InputDataSet;
[ , @ip_MRNumber = N'ip_mr_num' ]
[ , @ip_FirstName = N'ip_firstname' ]
[ , @ip_LastName = N'ip_lastname' ]
[ , @ip_DateofBirth = N'ip_birthdate' ]
[ , @ip_VisitReason = N'ip_visit' ]
[ , @ip_History = N'ip_history' ]
[ , @ip_DateofVisit = N'ip_visit_date' ]
[ , @ip_Reason = N'ip_reason']

[ , @op_MRNumber = N'op_mr_num' ]
[ , @op_FirstName = N'op_firstname' ]
[ , @op_LastName = N'op_lastname' ]
[ , @op_DateofBirth = N'op_birthdate' ]
[ , @op_VisitReason = N'op_visit' ]
[ , @op_History = N'op_history' ]
[ , @op_DateofVisit = N'op_visit_date' ]
[ , @op_Reason = N'op_reason']
WITH RESULT SETS ((MRNumber int,FirstName varchar(255),LastName varchar(255),DateofBirth varchar(255),VisitReason varchar(255),History varchar(255,)))

CREATE DATABASE OneView;

CREATE TABLE Patient_Info(
  MRNumber int,
  FirstName varchar(255),
  LastName varchar(255),
  DateofBirth varchar(255),
  VisitReason varchar(255),
)

CREATE TABLE Patient_History(
  MRNumber int,
  History varchar(255),
  DateofVisit varchar(255),
  Reason varchar(255),
)

CREATE TABLE Combined_Table(
  SELECT Patient_Info.MRNumber,Patient_Info.FirstName,Patient_Info.LastName,Patient_Info.DateofBirth, Patient_Info.VisitReason
  FROM Patient_Info
  FULL OUTER JOIN Patient_History ON Patient_Info.MRNumber = Patient_History.MRNumber
  ORDER BY Patient_Info.LastName
)
