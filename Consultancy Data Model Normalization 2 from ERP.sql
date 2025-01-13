create table student
( 
student_id number(6),
student_name varchar2(30),
date_of_birth date,
email_id varchar2(40),
phone_no number(10),
edu_qualifications varchar2(150),
is_coaching_req number(1),
constraint student_stid_pk primary key(student_id)
);

create table country
(
country_id char(3),
country_name varchar2(20),
constraint country_ctid_pk primary key(country_id)
);

create table consultancy
(
employee_id number(6),
admin_id number(6),
employee_name varchar2(30),
email_id varchar2(40),
phone_no number(10),
constraint consultancy_empid_pk primary key(employee_id)
);

create table visa_team
(
vis_emp_id number(6),
vis_emp_name varchar2(30),
vis_emp_email varchar2(40),
constraint visa_visempid_pk primary key(vis_emp_id)
);


create table coaching_institute
(
coaching_institute_id number(6),
course_id number(3),
course_name varchar2(30),
student_id number(6),
exam_status number(1),
cutoff_achieved number(1),
constraint coachinginstitute_ciid_pk primary key(coaching_institute_id),
constraint coachinginstitute_sid_fk foreign key (student_id) references student(student_id)
);

create table university
(
university_id number(6),
university_name varchar2(30),
state_id number(3),
program_name varchar2(20),
prereq_aptitude number(1),
prereq_english number(1),
university_admin_id number(6),
college_id number(6),
constraint university_uid_pk primary key(university_id),
constraint university_sid_fk foreign key (state_id) references state(state_id)
);



create table student_consultant
(
student_consultant_id number(6),
employee_id number(6),
student_id number(6),
country_id char(3),
vis_emp_id number(6),
constraint sc_scid_pk primary key(student_consultant_id),
constraint sc_eid_fk foreign key (employee_id) references consultancy(employee_id),
constraint sc_sid_fk foreign key (student_id) references student(student_id),
constraint sc_cid_fk foreign key (country_id) references country(country_id),
constraint sc_veid_fk foreign key (vis_emp_id) references visa_team(vis_emp_id)
);

create table student_university
(
student_university_id number (6),
student_id number(6),
university_id number(6),
i20_status number(1),
constraint su_suid_pk primary key(student_university_id),
constraint su_sid_fk foreign key (student_id) references student(student_id),
constraint su_uid_fk foreign key (university_id) references university(university_id)
);


create table state
(
state_id number(3),
state_name varchar2(20),
country_id char(3),
constraint state_stateid_pk primary key(state_id),
constraint state_cif_fk foreign key(country_id) references country(country_id)
);



select * from student order by 1;
insert into student values ('052261','Akshay Raj',to_date('01-10-1996','MM-DD-YYYY'),'akshay_raj.pallerla@uconn.edu',8602187219,'He is undergrad in electronics and IT experience 5years',0);
insert into student values ('052262','Sekhar',to_date('09-18-1996','MM-DD-YYYY'),'sekhar@uconn.edu',8602095944,'He is undergrad in electronics and IT experience 2.5years',0);
insert into student values ('052263','Yash',to_date('08-04-1996','MM-DD-YYYY'),'yash@uconn.edu',8602095942,'He is undergrad in mechanical and IT experience 4.5years',0);
insert into student values ('052264','Sindhu',to_date('01-11-1996','MM-DD-YYYY'),'sindhu@uconn.edu',9592399937,'She is undergrad in electronics, MBA graduate and IT experience 2years',0);
insert into student values ('052265','Venky',to_date('12-15-1995','MM-DD-YYYY'),'venkat@uconn.edu',8602095943,'He is undergrad in CS and IT experience 4.5years',1);
insert into student values ('052266','Amulya',to_date('05-17-1999','MM-DD-YYYY'),'amulya@uconn.edu',5189545499,'She is undergrad in CS, and IT experience 2years',1);
insert into student values ('052267','Deepa',to_date('07-22-1998','MM-DD-YYYY'),'deepa@uconn.edu',9599992665,'She is undergrad in electronics and IT experience 2.5years',1);
insert into student values ('052268','Lekha',to_date('01-15-2000','MM-DD-YYYY'),'lekha@uconn.edu',8609903793,'She is undergrad in electronics and IT experience 0years',1);
insert into student values ('052260','Hari',to_date('05-02-1996','MM-DD-YYYY'),'hari@uconn.edu',2243757737,'He is undergrad in electronics and IT experience 4years',0);
insert into student values ('052269','sai',to_date('04-10-1997','MM-DD-YYYY'),'sai@uconn.edu',2242558900,'He is undergrad in mechanical and IT experience 1.5years',1);



select * from country;
insert into country values ('USA','United States');
insert into country values ('CAN','Canada');
insert into country values ('GBR','United Kingdom');
insert into country values ('AUS','Australia');
insert into country values ('CHN','China');



select * from consultancy;
insert into consultancy values ('00001',null,'Sakshi','sakshi@consultant.edu',9700243339);
insert into consultancy values ('00002','00001','Mihika','mihika@consultant.edu',9966888622);
insert into consultancy values ('00003','00001','Kajol','kajol@consultant.edu',8457505072);
insert into consultancy values ('00004','00001','Vishita','vishita@consultant.edu',9160344510);
insert into consultancy values ('00005',null,'Chirag','chirag@consultant.edu',9988776655);
insert into consultancy values ('00006','00005','Rahul','rahul@consultant.edu',2233665511);
insert into consultancy values ('00007','00005','Rounak','rounak@consultant.edu',4455661122);



select * from visa_team;
insert into visa_team values ('000001','Vishal','vishal@visa.edu');
insert into visa_team values ('000002','Sravan','sravan@visa.edu');
insert into visa_team values ('000003','Bharat','bharat@visa.edu');
insert into visa_team values ('000004','Jeevan','jeevan@visa.edu');
insert into visa_team values ('000005','Vinay','vinay@visa.edu');
insert into visa_team values ('000006','Rushi','rushi@visa.edu');



select * from coaching_institute;
insert into coaching_institute values ('1',101,'GRE','52265',1,0);
insert into coaching_institute values ('2',102,'IELTS','52265',1,1);
insert into coaching_institute values ('3',103,'SAT','52266',0,0);
insert into coaching_institute values ('4',104,'TOEFL','52266',1,1);
insert into coaching_institute values ('5',103,'SAT','52267',0,0);
insert into coaching_institute values ('6',104,'TOEFL','52267',1,0);
insert into coaching_institute values ('7',105,'duolingo','52267',1,1);
insert into coaching_institute values ('8',101,'GRE','52267',1,1);
insert into coaching_institute values ('9',102,'IELTS','52267',1,0);
insert into coaching_institute values ('10',104,'TOEFL','52268',1,1);
insert into coaching_institute values ('11',105,'duolingo','52268',1,1);
insert into coaching_institute values ('12',101,'GRE','52268',1,1);
insert into coaching_institute values ('13',102,'IELTS','52269',1,1);



select * from state;
insert into state values ('1','Connecticut','USA');
insert into state values ('2','Texas','USA');
insert into state values ('3','California','USA');
insert into state values ('4','Florida','USA');
insert into state values ('5','Ottawa','CAN');
insert into state values ('6','Ontario','CAN');
insert into state values ('7','Toronto','CAN');
insert into state values ('8','Hainan','CHN');
insert into state values ('9','ZheJiang','CHN');
insert into state values ('10','Sichuan','CHN');
insert into state values ('11','Queensland','AUS');
insert into state values ('12','Victoria','AUS');
insert into state values ('13','Manchester','GBR');
insert into state values ('14','Cornwall','GBR');



select * from university;
insert into university values ('1','UConn','1','MS-BAPM',1,1,101,'1');
insert into university values ('2','UConn','1','MBA',0,1,101,'1');
insert into university values ('3','U-NewHaven','1','MS-CS',1,1,102,'2');
insert into university values ('4','U-NewHaven','1','MS-mechanical',0,1,102,'2');
insert into university values ('5','UTD','2','MSBA',1,1,103,'3');
insert into university values ('6','UTD','2','MS-CS',1,1,103,'3');
insert into university values ('7','UNT','2','MSDS',0,1,104,'4');
insert into university values ('8','UNT','2','MS-Biotech',0,0,104,'4');
insert into university values ('9','USC','3','MS-Chemical',0,1,105,'5');
insert into university values ('10','USF','4','MS-BAIM',1,1,106,'6');
insert into university values ('11','U-ottawa','5','MS-Applied CS',1,1,107,'7');
insert into university values ('12','York university','6','MS-instrumental',0,1,108,'8');
insert into university values ('13','USBC','7','MS-mathematics',1,1,109,'9');
insert into university values ('14','UOS','8','Petroleum doctorate',1,1,201,'11');
insert into university values ('15','U-shaoxing','9','Law',0,0,202,'12');
insert into university values ('16','U-chengdu','10','Arts and Acting',0,0,203,'13');
insert into university values ('17','U-bond','11','Project Management',0,1,301,'14');
insert into university values ('18','U-victoria','12','Music engineering',0,0,302,'15');
insert into university values ('19','U-manchester','13','political sciences',0,1,401,'16');
insert into university values ('20','Wilson university','14','Digital marketing',1,1,402,'17');



select * from student_university;

insert into student_university values ('1','52260','1',1);
insert into student_university values ('2','52261','4',0);
insert into student_university values ('3','52262','10',1);
insert into student_university values ('4','52263','12',1);
insert into student_university values ('5','52264','12',0);
insert into student_university values ('6','52265','3',1);
insert into student_university values ('7','52260','12',1);
insert into student_university values ('8','52266','14',1);
insert into student_university values ('9','52266','2',1);
insert into student_university values ('10','52269','8',1);
insert into student_university values ('11','52268','7',1);
insert into student_university values ('12','52267','6',1);
insert into student_university values ('13','52267','3',1);
insert into student_university values ('14','52265','16',1);


select * from student_consultant;
insert into student_consultant values ('1','1','52260','USA','1');
insert into student_consultant values ('2','2','52260','CAN','2');
insert into student_consultant values ('3','3','52261','USA','3');
insert into student_consultant values ('4','4','52262','USA','3');
insert into student_consultant values ('5','5','52263','CAN','2');
insert into student_consultant values ('6','6','52264','CAN','4');
insert into student_consultant values ('7','7','52265','USA','1');
insert into student_consultant values ('8','2','52265','CHN','5');
insert into student_consultant values ('9','4','52266','CHN','5');
insert into student_consultant values ('10','6','52266','USA','1');
insert into student_consultant values ('11','5','52269','USA','3');
insert into student_consultant values ('12','3','52268','USA','1');
insert into student_consultant values ('13','7','52267','USA','3');
insert into student_consultant values ('14','7','52267','USA','1');









select * from consultancy co 
join student_consultant sc
on co.employee_id=sc.employee_id
join country c
on sc.country_id=c.country_id
join state s
on c.country_id=s.country_id;

select * from student s 
join student_consultant sc
on s.student_id=sc.employee_id
join country c
on sc.country_id=c.country_id
join state s
on c.country_id=s.country_id;



select  * from student_consultant;