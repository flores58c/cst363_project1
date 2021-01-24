create table patient 
(patient_id int(255),
ssn char(13),
name char(25) , 
age int(255),
address char(100),
PRIMARY KEY(patient_id)
);


insert into patient values

(1,'4443367888','Vernita',21,'5506 Atlas Street, South Pasadena,CA,90032'),
(2,'7897932222','Michael',99,'1000 Mission St., South Pasadena, CA 91030'),
(3,'8798234789','Will',50,'251 North Bristol Avenue, Los Angeles, CA 90049'),
(4,'2432490800','Ferris' ,44,'4160 Country Club Dr., Long Beach, CA 90807'),
(5,'7521343124','Steve',50,'2101 Waverley Street, Palo Alto, CA 94301'),
(6,'0923534522','A. Einstein',70,'707 S Oakland Ave, Pasadena, CA 91106'),
(7,'3028579453','R. Feynman',70,' 895 Altadena Dr, Altadena, CA 91001'),
(8,'6753254344','M. Jackson',50,'100 Carlwood Drive, Beverly Hills, CA'),
(9,'8942594324','C. Eastwood', 99, '846 Stradella Road, CA')

;

create table doctor
(
doc_id int(255),
ssn char(13),
name char(25) , 
speciality char(100),
yearExperience int(255),
Primary key(doc_id)
);

insert into doctor values 

(1,'2224448888','Schwartz','Oncology',10),
(2,'2994995999','House','Diagnostic Medicine',30),
(3,'8885235432','Price','Cardiology',2),
(4,'5234589342','Davis','Allergies',5),
(5,'2341123333','Talwar','Pediatrics',4)

;
create table pharmacy
(pharmacy_id char(10),
pharmacy_name char(50) not null,
address char(100) not null,
phone char(20),
primary key (pharmacy_id));

insert into pharmacy values 
('WAL','Walgreens','Sesame St.','111-222-3333'),
('RIT','Rite Aid','Elm St.','222-333-4444'),
('CVS','CVS Pharmacy','Alphabet St.','333-444-5555');

create table prescription
(
prescribe_id int(255),
patient_id int(255),
doc_id int(255),
drug_id int(255),
prescription_date date,
quantity int(100),
pharmacy_id char(10),
foreign key(doc_id) references doctor(doc_id),
foreign key (pharmacy_id) references pharmacy(pharmacy_id)
);
-- pharmacy id for prescripton

insert into prescription values
(1,1,1,01,'2021/01/01',10,'WAL'),
(2,2,3,05,'2020/12/21',32,'RIT'),
(3,9,2,04,'2020/11/20',20,'CVS'),
(4,3,3,06,'2019/01/21',10,'CVS'),
(5,6,1,02, '2019/04/10',5,'WAL'),
(6,4,4,03,'2020/05/12',30,'RIT'),
(7,5,2,09,'2021/01/05',5,'RIT'),
(8,8,1,10,'2019/12/12',50,'WAL'),
(9,7,5,07,'2020/09/01',20,'CVS')
;
-- what is patients name join patient table to prescription to get name

create table pharmComp
(comp_id char(5),
compName char(30),
company_phone char(20)
);

insert into pharmComp values

('JJ',"Johnson & Johnson",'1-866-565-2873'),
('PFZ',"Pfizer",'1-800-879-3477'),
('MD',"Moderna",'1‑866‑663‑3762'),
('NV',"Novartis",'1-888-669-6682'),
('MK',"Merck",'1-800-444-2080')
;

create table drug 
(drug_id int(10),
trade_name char(50),
formula char(50),
primary key (drug_id));

insert into drug values 
(01,'Parlodel','C32H40BrN5O5'), -- oncology
(02,'Dostinex','C26H37N5O2'),
(03,'Comirnaty','BNT162b2'), -- covid
(04,'Advil','C13H18O2'), -- headache
(05,'Sectral','C18H28N2O4'), -- cardiology
(06,'Tenormin','C14H22N2O3'),
(07,'Zyrtec','C21H25ClN2O32HCl'), -- allergies
(08,'Allegra','C32H39NO4'), -- allergies
(09,'Ibuprofen','C13H18O2'), -- children 
(10,'Amoxicillin','C16H19N3O5S'); -- antibiotic



create table supervisor
(
s_id int(255),
s_name char(15) not null -- supervisor can change and there needs to be a supervisor 
);

insert into supervisor values

(1,"Henry"),
(2,'Karen'),
(3,'Jacob')
;


-- not simplified because the contract needs all these items
create table contract
(contract_id int(255),
start_date date,
end_date date,
s_id int(255),
withComp int(255),
pharmacy_id int(255),
drug_id int(255),
foreign key (drug_id) references drugs(drug_id),
foreign key (s_id) references supervisor(s_id),
foreign key(withComp) references pharmComp(comp_id),
foreign key(pharmacy_id) references pharmacy(pharmacy_id)
);



