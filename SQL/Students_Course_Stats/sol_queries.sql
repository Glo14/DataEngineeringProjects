--select distinct count(*)
--from "student_engagement"; --74246

--select distinct count(*)
--from "student_info"; --40979

--select distinct count(*)
--from "student_purchases"; --5922

/*
select i.student_id, min(i.date_registered), min(e.date_watched), min(p.date_purchased)
from student_engagement as e
join student_info as i
	ON e.student_id=i.student_id
join student_purchases as p
	ON i.student_id=p.student_id
group by i.student_id
*/

with first_dates as (
select 
	e.student_id, 
	min(i.date_registered) as date_registered, 
	min(e.date_watched) as first_date_watched,
	min(p.date_purchased) as first_date_purchased
from student_engagement as e
left join student_purchases as p
	ON e.student_id=p.student_id
join student_info as i
	ON e.student_id=i.student_id
group by e.student_id
),

diff_dates as (
select student_id, 
	date_registered, 
	first_date_watched, 
	first_date_purchased,
	abs(date_registered - first_date_watched) as date_diff_reg_watch,
	abs(first_date_watched - first_date_purchased) as date_diff_watch_purch
from first_dates
where first_date_watched <= first_date_purchased OR first_date_purchased IS NULL
)

--Questions
--What is the free-to-paid conversion rate of students who have watched a lecture on the 365 platform?
/*
select ROUND((select count(*)
		from diff_dates
		where first_date_purchased is NOT null)::decimal/(select count(*) from diff_dates)::decimal, 2) as free_to_paid_rate
from diff_dates
limit 1 --0.11
*/


--Question
--What is the average duration between the registration date and when a student has watched a lecture for the first time (date of first-time engagement)?
/*
select avg(date_diff_reg_watch) 
from diff_dates --3.4238953344853123
*/


--Question
--What is the average duration between the date of first-time engagement and when a student purchases a subscription for the first time (date of first-time purchase)?
/*
select avg(date_diff_watch_purch) 
from diff_dates --26.2471566054243220
*/

select *
from diff_dates
where student_id=268727