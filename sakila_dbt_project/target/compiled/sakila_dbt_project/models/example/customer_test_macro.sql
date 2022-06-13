

select
customer_id,
first_name,
last_name,

    concat(first_name,'-',last_name)
 as the_full_name
from
"sakila_wh"."examples"."hello_world"
where customer_id < 10