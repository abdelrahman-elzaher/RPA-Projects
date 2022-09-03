create database Uipath;
use uipath;
create table employees (
emp_no int not null,
first_name varchar(15) not null,
last_name varchar(15),
team_name varchar(20) not null,
email  varchar(40) not null,
primary key (emp_no),
unique key(email)
);
create table  salaries(
emp_no int not null,
from_date date not null,
to_date date not null,
primary key(emp_no,from_date),
foreign Key (emp_no) references employees (emp_no) on delete cascade
);
drop table attendance;
create table  Attendance(
emp_no int not null,
attendance_day date not null,
attendance enum("Attendant","absent") default"absent",
primary key(emp_no,attendance_day),
foreign Key (emp_no) references employees (emp_no) on delete cascade
);
create table TeamLeaders(
	 emp_no int not null,
    team_name varchar(20) not null,
    from_date date not null,
    primary key (team_name),
unique key(emp_no),
foreign Key (emp_no) references employees (emp_no) on delete cascade
    );
    

    
    update teamleaders
    set emp_no=5
    where
    team_name="RPA Team";