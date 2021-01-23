create table patient 
(patient_id int(255),
ssn varchar(13),
name char(25) , 
age int(255),
address char(100));

insert into patient values( (1,4443332222,'alfred',21,'rowing ave'));

create table doctor
(doc_id int(255),
ssn varchar(13),
name char(25) , 
speciality char(100),
yearExperience int(255));

insert into doctor values (
(1,2224448888,'Schwartz',32,'Applegate Road')
);