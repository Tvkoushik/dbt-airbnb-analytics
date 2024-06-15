select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    select *
    from airbnb.DEV.dim_listings_cleansed
    where
        LISTING_ID is null or
        LISTING_NAME is null or
        ROOM_TYPE is null or
        MINIMUM_NIGHTS is null or
        HOST_ID is null or
        PRICE is null or
        CREATED_AT is null or
        UPDATED_AT is null or
        
        false

      
    ) dbt_internal_test