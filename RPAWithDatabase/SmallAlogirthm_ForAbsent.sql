select concat(e.first_name ," " ,e.last_name) as Team_Leader_Name,e.email,Result.team_name,Result.attendance,GROUP_CONCAT((concat(Result.first_name," ",Result.last_name)))  AS EmployeesAbsent
from(
select t.emp_no as team_leader,t.team_name, e.emp_no,e.first_name,e.last_name,d.attendance_day,d.attendance 
	from
		employees as e
		inner join
		attendance as d on e.emp_no=d.emp_no
		inner join
	TeamLeaders as t on t.team_name=e.team_name 	
	where	
		d.attendance_day="2022-03-18"  and t.emp_no!=d.emp_no ) as Result 
	inner join
    employees as e on e.emp_no=Result.team_leader
    where
    Result.attendance="absent"
 group by  email;
 