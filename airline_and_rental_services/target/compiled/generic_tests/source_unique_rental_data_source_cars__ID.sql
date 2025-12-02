
    
    

select
    _ID as unique_field,
    count(*) as n_records

from demo_ask_db.rental.cars
where _ID is not null
group by _ID
having count(*) > 1


