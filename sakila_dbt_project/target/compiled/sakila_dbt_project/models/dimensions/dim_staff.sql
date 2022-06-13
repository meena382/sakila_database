

with staff_base as (
select
*,
(case when active::int = 1 then 1 else 0 end) as "active_int",
(case when active::int = 1 then 'yes' else 'no' end) as "active_desc",
'2022-06-13 04:36:37'::timestamp as dbt_time
from
"sakila_wh"."stg"."staff"
)

select
	staff_id,
	first_name,
	last_name,
	email,
  active_int as active,
  active_desc,
	last_update,
  dbt_time
from
	staff_base