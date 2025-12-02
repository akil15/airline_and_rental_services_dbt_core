
  
    

create or replace transient  table demo_ask_db.demo_ask_schema.marts_airline_and_rental_summary
    
    
    
    as (with
    tmp_table as (
        select
            left(
                md5(
                    marts_airline_flights_summary.passenger_last_name
                    || marts_airline_flights_summary.passenger_first_name
                ),
                24
            ) as surrogate_keys,
            *
        from demo_ask_db.demo_ask_schema.marts_airline_flights_summary as marts_airline_flights_summary
        natural join
            (
                select
                    rental_id,
                    price_usd,
                    license_plate,
                    car_type,
                    rental_date,
                    return_date,
                    pickup_location,
                    drop_off_location,
                    extra_driver,
                    gps,
                    child_seat,
                    insurance
                from demo_ask_db.demo_ask_schema.marts_rental_orders_summary
            ) as marts_rental_orders_summary
    )

select distinct
    (surrogate_keys)
    surrogate_keys,
    origin as flight_origin,
    destination as flight_destination,
    flight_code,
    flight_id,
    flight_date,
    gate,
    ticket_number,
    seat_number,
    passenger_first_name,
    passenger_last_name,
    rental_id as rental_car_id,
    price_usd as rental_price_usd,
    license_plate as passenger_car_license_plate,
    car_type as rental_car_type,
    rental_date as rental_car_pickup_date,
    return_date as rental_car_return_date,
    pickup_location as rental_car_pickup_location,
    drop_off_location as rental_car_drop_off_location,
    extra_driver as rental_car_options_extra_driver,
    gps as rental_car_options_gps,
    child_seat as rental_car_options_child_seat,
    insurance as rental_car_options_insurance,
from tmp_table
    )
;


  