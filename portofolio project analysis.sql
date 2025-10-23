# Project Status

create or replace view `rama adi`.project_analysis as
with project_status as (
select 
	project_id,
    project_name,
    project_budget,
    'upcoming' as status
from `rama adi`.`upcoming projects`
union all
select
	project_id,
    project_name,
    project_budget,
    'completed' as status
from `rama adi`.completed_projects
)


# Big Table
select 
	e.ï»¿employee_id,
    e.first_name,
    e.last_name,
    e.job_title,
    e.salary,
    d.Department_Name,
    d.Department_Budget,
    d.Department_Goals,
    pa.project_id,
    p.project_name,
    p.project_budget,
    p.status
from `rama adi`.employees e
	join `rama adi`.departments d
		on e.department_id = d.ï»¿Department_ID
	join `rama adi`.project_assignments pa
		on pa.employee_id = e.ï»¿employee_id
	join project_status p
		on p.project_id = pa.project_id
;
