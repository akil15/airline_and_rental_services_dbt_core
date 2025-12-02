
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select CAR_TYPE
from demo_ask_db.rental.cars
where CAR_TYPE is null



  
  
      
    ) dbt_internal_test