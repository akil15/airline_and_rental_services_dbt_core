
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    _ID as unique_field,
    count(*) as n_records

from demo_ask_db.airline.flights
where _ID is not null
group by _ID
having count(*) > 1



  
  
      
    ) dbt_internal_test