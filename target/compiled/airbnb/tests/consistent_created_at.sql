select *
from airbnb.DEV.dim_listings_cleansed l
inner join airbnb.DEV.fct_reviews r using (listing_id)
where l.created_at >= r.review_date