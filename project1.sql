create table patient 
(patient_id int(255) not null,
ssn char(13),
name char(25) not null, 
age int(255),
address char(100),
PRIMARY KEY(patient_id)
);

-- ssn has option to be null some patients may forget ssn cards 

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
doc_id int(255) not null,
ssn char(13),
name char(25) not null, 
speciality char(100) not null,
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
(pharmacy_id char(10) not null,
pharmacy_name char(50) not null,
address char(100) not null,
phone char(20),
primary key (pharmacy_id));

insert into pharmacy values 
('WAL','Walgreens','Sesame St.','111-222-3333'),
('RIT','Rite Aid','Elm St.','222-333-4444'),
('CVS','CVS Pharmacy','Alphabet St.','333-444-5555');

-- price for drug

create table drug 
(drug_id int(10) not null,
trade_name char(50),
formula char(50),
drug_price float(2),
primary key (drug_id));

insert into drug values 
(01,'Parlodel','C32H40BrN5O5',33.91), -- oncology
(02,'Dostinex','C26H37N5O2',235.63),
(03,'Comirnaty','BNT162b2',37.00), -- covid
(04,'Advil','C13H18O2',.31), -- headache
(05,'Sectral','C18H28N2O4',5.18), -- cardiology
(06,'Tenormin','C14H22N2O3',13.89),
(07,'Zyrtec','C21H25ClN2O32HCl',.87), -- allergies
(08,'Allegra','C32H39NO4',1.94), -- allergies
(09,'Ibuprofen','C13H18O2',.40), -- children 
(10,'Amoxicillin','C16H19N3O5S',.49); -- antibiotic

-- date filled
create table prescription
(
prescribe_id int(255) not null,
patient_id int(255) not null,
doc_id int(255)not null,
drug_id int(255) not null,
prescription_date date ,
last_filled date,
quantity int(100),
pharmacy_id char(10),
primary key (prescribe_id),
foreign key(doc_id) references doctor(doc_id),
foreign key (pharmacy_id) references pharmacy(pharmacy_id),
foreign key(patient_id) references patient(patient_id),
foreign key(drug_id) references drug(drug_id)
);
-- pharmacy id for prescripton

insert into prescription values
(1,1,1,01,'2021/01/01','2021/01/01',10,'WAL'),
(2,2,3,05,'2020/12/21','2020/12/21',32,'RIT'),
(3,9,2,04,'2020/11/20','2020/11/20',20,'RIT'),
(4,3,3,06,'2019/01/21','2019/01/21',10,'RIT'),
(5,6,1,02, '2019/04/10', '2019/04/10',5,'WAL'),
(6,4,4,03,'2020/05/12','2020/05/12',30,'WAL'),
(7,5,2,09,'2021/01/05','2021/01/05',5,'CVS'),
(8,8,1,10,'2019/12/12','2019/12/12',50,'CVS'),
(9,7,5,07,'2020/09/01','2020/09/01',20,'CVS')
;
--  1 what is patients name join patient table to prescription to get name

create table pharmComp
(comp_id char(5) not null,
compName char(30) not null,
company_phone char(20),
primary key(comp_id)
);

insert into pharmComp values

('JJ',"Johnson & Johnson",'1-866-565-2873'), -- ? .25 @ W  ? .5 @ RIT ? .75 @ CVS
('PFZ',"Pfizer",'1-800-879-3477'),
('MD',"Moderna",'1‑866‑663‑3762'),
('NV',"Novartis",'1-888-669-6682'),
('MK',"Merck",'1-800-444-2080')
;



-- we decided to normalize supervisor table to keep the supevisors for each company separate
-- pharamcies don't need the other supervisors from other stores
-- multi company table for supervisors
create table supervisor_RIT
(
s_id int(255) not null,
s_name char(15) not null, -- supervisor can change and there needs to be a supervisor 
primary key(s_id)
);

insert into supervisor_RIT values
(1,"Bob"),
(2,'Bill'),
(3,'Roger')
;

create table supervisor_WAL
(
s_id int(255) not null,
s_name char(15) not null,-- supervisor can change and there needs to be a supervisor 
primary key(s_id)
);

insert into supervisor_WAL values

(1,"Henry"),
(2,'Karen'),
(3,'Keith')
;

create table supervisor_CVS
(
s_id int(255) not null,
s_name char(15) not null, -- supervisor can change and there needs to be a supervisor 
primary key (s_id)
);


insert into supervisor_CVS values

(1,"Hank"),
(2,'Kathy'),
(3,'Jacob')
;


-- not simplified because the contract needs all these items
-- text of contract price of drug and agreement on payment to company
create table contract_CVS
(contract_id char(100) not null,
start_date date,
end_date date,
s_id int(255),
comp_id char(10),
drug_id int(255),
pharmacy_id char(10),
con_text char(100),
primary key (contract_id),
foreign key (pharmacy_id) references pharmacy(pharmacy_id),
foreign key (drug_id) references drug(drug_id),
foreign key (s_id) references supervisor_CVS(s_id),
foreign key(comp_id) references pharmComp(comp_id)
);

create table contract_RIT
(contract_id char(100) not null,
start_date date,
end_date date,
s_id int(255),
comp_id char(10),
drug_id int(255),
pharmacy_id char(10),
con_text char(100),
primary key (contract_id),
foreign key (pharmacy_id) references pharmacy(pharmacy_id),
foreign key (drug_id) references drug(drug_id),
foreign key (s_id) references supervisor_RIT(s_id),
foreign key(comp_id) references pharmComp(comp_id)
);

-- markup needs to be dropped since it is dependent on non key column company_id
create table contract_WAL
(contract_id char(100) not null,
start_date date,
end_date date,
s_id int(255),
comp_id char(10),
drug_id int(255),
pharmacy_id char(10),
con_text char(100),
primary key (contract_id),
foreign key (pharmacy_id) references pharmacy(pharmacy_id),
foreign key (drug_id) references drug(drug_id),
foreign key (s_id) references supervisor_WAL(s_id),
foreign key(comp_id) references pharmComp(comp_id)
);
-- allegra -- ibuprofen -- advil -- zyrtec
-- 2 Where is the prescription being made? Prescription -> Pharmacy -> Contract
insert into contract_WAL values
('1W','2021/01/10','2023/01/10',1,'JJ',01,'WAL','Walgreens agrees to pay for drug @ marginal cost and plans to sell at Markup .25' ),
('2W', '2021/01/10','2023/01/10',1,'JJ',02,'WAL','Walgreens agrees to pay for drug @ marginal cost and plans to sell at Markup .25' ),
('3W','2021/01/20','2023/01/20',2,'PFZ',03,'WAL','Walgreens agrees to pay for drug @ marginal cost and plans to sell at Markup .25'),
('4W','2020/09/09','2021/09/09',1,'NV',08,'WAL','Walgreens agrees to pay for drug @ marginal cost and plans to sell at Markup .25'),
('5W','2021/03/01','2023/03/01',3,'PFZ',04,'WAL','Walgreens agrees to pay for drug @ marginal cost and plans to sell at Markup .25')
;

insert into contract_RIT values
('1R','2021/01/01','2023/01/01',1,'PFZ',04,'RIT','Rite-Aid agrees to pay for drug @ marginal cost and plans to sell at Markup .15'),
('2R','2020/01/01','2021/01/01',2,'MD',05,'RIT','Rite Aid agrees to pay for drug @ marginal cost and plans to sell at Markup .15'),
('3R','2020/03/01','2021/03/01',3,'MD',06,'RIT','Rite Aid agrees to pay for drug @ marginal cost and plans to sell at Markup .15'),
('4R','2020/07/09','2021/07/09',1,'NV',08,'RIT','Rite Aid agrees to pay for drug @ marginal cost and plans to sell at Markup .15')
;

insert into contract_CVS values
('1C','2020/02/02','2021/02/02',1,'NV',07,'CVS','CVS agrees to pay for drug @ marginal cost and plans to sell at Markup .20'),
('2C','2010/01/01','2025/01/01',2,'MK',09,'CVS','CVS agrees to pay for drug @ marginal cost and plans to sell at Markup .20'),
('3C','2020/01/01','2021/01/01',3,'MK',10,'CVS','CVS Pharmacy agrees to pay for drug @ marginal cost and plans to sell at Markup .20'),
('4C','2021/04/01','2023/04/01',1,'PFZ',04,'CVS','CVS agrees to pay for drug @ marginal cost and plans to sell at Markup .20'),
('5C','2020/02/09','2021/02/09',1,'NV',08,'CVS','CVS agrees to pay for drug @ marginal cost and plans to sell at Markup .20')
;

create table markup_WAL
(
con_text char(100),
markup float(2)
);

insert into markup_WAL values

('Walgreens agrees to pay for drug @ marginal cost and plans to sell at Markup .25',.25);


create table markup_CVS
(
con_text char(100),
markup float(2)
);

insert into markup_CVS values

('CVS agrees to pay for drug @ marginal cost and plans to sell at Markup .20',.20);

create table markup_RIT
(
con_text char(100),
markup float(2)

);

insert into markup_RIT values

('Rite Aid agrees to pay for drug @ marginal cost and plans to sell at Markup .15',.15);

