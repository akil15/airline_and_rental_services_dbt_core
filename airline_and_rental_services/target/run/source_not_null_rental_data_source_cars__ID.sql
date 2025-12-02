
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select _ID
from demo_ask_db.rental.cars
where _ID is null



  
  
      
    ) dbt_internal_test