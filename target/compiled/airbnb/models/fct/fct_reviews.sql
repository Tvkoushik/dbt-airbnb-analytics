
with  __dbt__cte__src_reviews as (
WITH raw_reviews AS (
    SELECT
        *
    FROM
        airbnb.raw.raw_reviews
)
SELECT
    listing_id,
    date AS review_date,
    reviewer_name,
    comments AS review_text,
    sentiment AS review_sentiment
FROM
    raw_reviews
), src_reviews as (select * from __dbt__cte__src_reviews)
select
    md5(cast(coalesce(cast(listing_id as 
    varchar
), '') || '-' || coalesce(cast(review_date as 
    varchar
), '') || '-' || coalesce(cast(reviewer_name as 
    varchar
), '') || '-' || coalesce(cast(review_text as 
    varchar
), '') as 
    varchar
)) as review_id, *
from src_reviews
where
    review_text is not null
    
        and review_date > (select max(review_date) from airbnb.DEV.fct_reviews)
    