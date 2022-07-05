-- cleaning data in sql queries


-- checking info
--data exploration

select * 
from PortfolioProject..USpolice



-- tableau visualization mission
--  which age kill the most, bar chart  , <> 7
-- which gender get kill the most , pie bar     ,<>1
-- from year to year get kill the most , line bar    ,<>2
-- cause of death in,  pie bar                         ,<>3   gunshot in % , % other taser,beaten
-- city of death                                ,<>4
--which race get killed the most             ,<> 5 
-- mental sick patient                   ,<>6 



-- distinct
select distinct age
from PortfolioProject..USpolice
order by age

select distinct gender , Count(Gender)
from PortfolioProject..USpolice
group by gender


select distinct race
from PortfolioProject..USpolice

select distinct  city
from PortfolioProject..USpolice
order by city

select distinct [cause of death]
from PortfolioProject..USpolice
order by [cause of death]

select distinct [Mental Sick]
from PortfolioProject..USpolice
order by [Mental Sick]

 


--list to do
-- delete age : null																					   L<> done
-- delet gender : , white, null, unknown																   L<> done
-- delet race : 05/09/2017  ,  null																		   L<>Done
-- delete city : null																					   L<>done
--changing date of incident to display only d/m/y                                                          L<>Done
-- delete cause of death: [gunshot, beanbag gun = same],null,  [ same taser name, taser, Taser", tasered]  L<>Done
--delete mental sick: unknown same as unclear, null                                                        L<> DOne
--  i mean null is empty value which is unkown and is the same as unclear :) right? ,or am i wrong?




----------------------------------------------------------------------
-- delete age null
select *
from PortfolioProject..USpolice
where age is null

delete 
portfolioProject..USpolice
where age is null






-- deleting unkown in gender
select *
from PortfolioProject..USpolice 
where gender = 'Unknown'

delete 
portfolioProject..USpolice
where gender = 'Unknown'




 -- deletin null in city
select *
from PortfolioProject..USpolice 
where city is null

delete
from PortfolioProject..USpolice 
where city is null




-- changing date
select date, convert (date, date)
from PortfolioProject..USpolice 

alter table PortfolioProject..USpolice 
add dateincident date

update PortfolioProject..USpolice 
set dateincident = convert (date, date)


--Updating Cause Of Death

select [cause of death]
, case when [cause of death] = 'Gunshot, Bean Bag Gun' then 'Gunshot, Bean bag'
	   when [cause of death] = 'Gunshot, Beanbag Gun' then 'Gunshot, Bean bag'
	  when [cause of death] = 'Taser' then 'Taser'
	  when [cause of death] = 'Tasered' then 'Taser'

	   else [cause of death]
	   end
	 

from PortfolioProject..USpolice
order by 1


update PortfolioProject..USpolice
set [cause of death] = case when [cause of death] = 'Gunshot, Bean Bag Gun' then 'Gunshot, Bean bag'
	   when [cause of death] = 'Gunshot, Beanbag Gun' then 'Gunshot, Bean bag'
	  when [cause of death] = 'Taser' then 'Taser'
	  when [cause of death] = 'Tasered' then 'Taser'

	   else [cause of death]
	   end




-- MEntal Sick 

select [mental sick]
, case when [mental sick] is null then 'Unknown'
	  when [mental sick] = 'Unknown' then 'Unknown'
	  when  [mental sick] = 'Unclear' then 'Unknown'

	   else  [mental sick]
	   end

	   from PortfolioProject..USpolice
order by 1



update PortfolioProject..USpolice
set [mental sick]  = case when [mental sick] is null then 'Unknown'
	  when [mental sick] = 'Unknown' then 'Unknown'
	  when  [mental sick] = 'Unclear' then 'Unknown'

	   else  [mental sick]
	   end



--changing age to around age

--tableau visualization table


--<>1
--pie

select distinct Gender , count( gender) as Number
from PortfolioProject..USpolice
group by gender

--<>2
-- us line chart


select distinct year(dateincident) as Date, count(year(dateincident)) Number
from PortfolioProject..USpolice
group by year(dateincident)
order by date



--<>3 
--pie chart
select distinct [Cause Of Death], count([Cause of death]) as Number
from PortfolioProject..USpolice
group by [Cause of death]
order by Number desc


--<>4
--bar chart
select distinct City, count(city) as [Number Of Cases]
from PortfolioProject..USpolice
group by city
having  count(city) >= 39
order by [Number Of Cases]
desc



--<>5
--
select distinct Race, count(race) as Victim
from PortfolioProject..USpolice
group by race
order by Victim desc


--<>6
--pie
select distinct [Mental Sick], count ([Mental Sick]) as Number
from PortfolioProject..USpolice
group by [Mental Sick]
order by Number desc



--<>7
--
select age
, case when age <18 then 'Under 18'
   when age between 18 and 24 then '18-24'
   when age between 25 and 34 then '25-34'
   when age between 35 and 50 then '35-50'
   when age >50 then 'Above 50'
 ENd
from PortfolioProject..USpolice
order by age



alter table PortfolioProject..USpolice
add Ages nvarchar(255)


update  PortfolioProject..USpolice
set ages =  case when age <18 then 'Under 18'
   when age between 18 and 24 then '18-24'
   when age between 25 and 34 then '25-34'
   when age between 35 and 50 then '35-50'
   when age >50 then 'Above 50'
 ENd

 select *
from portfolioProject..USpolice


select distinct Ages, count(ages) as Quantity
from PortfolioProject..USpolice
group by ages
