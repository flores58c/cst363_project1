create table patient 
(patient_id int(255),
ssn varchar(13),
name char(25) , 
age int(255),
address char(100));


insert into patient values( 
(1,4443367888,'Vernita',21,'5506 Atlas Street, South Pasadena,CA,90032'),
(2,7897932222,'Michael',99,'1000 Mission St., South Pasadena, CA 91030'),
(3,8798234789,'Will',50,'251 North Bristol Avenue, Los Angeles, CA 90049'),
(4,2432490800,'Ferris' ,44,'4160 Country Club Dr., Long Beach, CA 90807'),
(5,7521343124,'Steve',50,'2101 Waverley Street, Palo Alto, CA 94301'),
(6,0923534522,'A. Einstein',70,'707 S Oakland Ave, Pasadena, CA 91106'),
(7,3028579453,'R. Feynman',70,' 895 Altadena Dr, Altadena, CA 91001'),
(8,6753254344,'M. Jackson',50,'100 Carlwood Drive, Beverly Hills, CA'),
(9,8942594324,'C. Eastwood', 99, '846 Stradella Road, CA')

);

create table doctor
(doc_id int(255),
ssn varchar(13),
name char(25) , 
speciality char(100),
yearExperience int(255));

insert into doctor values (
(1,2224448888,'Schwartz',32,'Oncology',10),
(2,2994995999,'House',32,'Diagnostic Medicine',30),
(3,8885235432,'Price',44,'Cardiology',2),
(4,5234589342,'Davis',50,'Allergies',5),
(5,2341123333,'Talwar',34,'Pediatrics',4)

);

-- prescription table 

create table pharmComp
(comp_id int(255),
compName char(30),
company_phone varchar(11),
contract_id int(255)
);

insert into pharmComp values
(
(1,"Johnson & Johnson",1-866-565-2873,1),
(2,"Pfizer",1-800-879-3477,2),
(3,"Moderna",1‑866‑663‑3762,3),
(4,"Novartis",1-888-669-6682,4),
(5,"Merck",1-800-444-2080,5)
);
create table contract
(contract_id int(255),
start_date date,
end_date date
);
