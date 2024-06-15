select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      select *
from airbnb.DEV.dim_listings_cleansed l
inner join airbnb.DEV.fct_reviews r using (listing_id)
where l.created_at >= r.review_date
      
    ) dbt_internal_test