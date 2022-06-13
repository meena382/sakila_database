

with stg_film as (
	select
	*,
	(case
	when length<=75 then 'short'
	when (length>75 and length<=120) then 'medium'
	when length>120 then 'long'
	else 'na' end) as length_desc,
	COALESCE(original_language_id,0) as original_language_id_zero,
	case when POSITION('Trailers' in special_features::varchar)>0 then 1 else 0 end  as has_trailers,
	case when POSITION('Commentaries' in special_features::varchar)>0 then 1 else 0 end  as has_commentaries,
	case when POSITION('Deleted Scenes' in special_features::varchar)>0 then 1 else 0 end  as has_deleted_scenes,
	case when POSITION('Behind the Scenes' in special_features::varchar)>0 then 1 else 0 end  as has_behind_the_scenes,
	'2022-06-13 04:36:37'::timestamp as dbt_time
	from
	"sakila_wh"."stg"."film"
),

language as (
	select * from "sakila_wh"."stg"."language"
),

category as (
	select * from "sakila_wh"."stg"."category"
),

film_category as (
	select * from "sakila_wh"."stg"."film_category"
),

stg_film_1 as (
	select
	stg_film.*,
	language.name as lang_name
	from
	stg_film
	left join language on 1=1
	and stg_film.language_id = language.language_id
),

stg_film_2 as (
	select
		stg_film_1.*,
		category.category_id,
		category.name as category_desc
	from
	stg_film_1

	left join film_category on 1=1
	and stg_film_1.film_id = film_category.film_id

	left join category on 1=1
	and film_category.category_id  = category.category_id
)


select
  film_id,
  title,
  description,
  release_year,
  language_id,
  lang_name,
  original_language_id_zero as original_language_id,
  rental_duration,
  rental_rate,
  length,
  length_desc,
  replacement_cost,
  rating,
  category_id,
  category_desc,
  special_features,
  has_trailers,
  has_commentaries,
  has_behind_the_scenes,
  has_deleted_scenes,
  last_update,
	dbt_time
from
stg_film_2

where 1=1

