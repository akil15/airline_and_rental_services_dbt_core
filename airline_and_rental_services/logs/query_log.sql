-- created_at: 2025-12-02T15:48:16.465317+00:00
-- finished_at: 2025-12-02T15:48:16.657665+00:00
-- elapsed: 192ms
-- outcome: success
-- dialect: snowflake
-- node_id: not available
-- query_id: 01c0c8b4-0001-76b8-0001-b35a000385d6
-- desc: execute adapter call
show terse schemas in database demo_ask_db
    limit 10000
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"airline_and_rental_services","target_name":"dev","connection_name":""} */;
-- created_at: 2025-12-02T15:48:16.924937+00:00
-- finished_at: 2025-12-02T15:48:16.989347+00:00
-- elapsed: 64ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.airline_and_rental_services.rental_model
-- query_id: 01c0c8b4-0001-76b3-0001-b35a000391c6
-- desc: not provided
use warehouse demo_ask_wh;
-- created_at: 2025-12-02T15:48:16.996902+00:00
-- finished_at: 2025-12-02T15:48:17.102397+00:00
-- elapsed: 105ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.airline_and_rental_services.rental_model
-- query_id: 01c0c8b4-0001-76b3-0001-b35a000391ca
-- desc: get_relation > list_relations call
SHOW OBJECTS IN SCHEMA "DEMO_ASK_DB"."DEMO_ASK_SCHEMA" LIMIT 10000;
-- created_at: 2025-12-02T15:48:17.253168+00:00
-- finished_at: 2025-12-02T15:48:17.329332+00:00
-- elapsed: 76ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.airline_and_rental_services.airline_flights_model
-- query_id: 01c0c8b4-0001-76b3-0001-b35a000391ce
-- desc: not provided
use warehouse demo_ask_wh;
-- created_at: 2025-12-02T15:48:17.119802+00:00
-- finished_at: 2025-12-02T15:48:18.199113+00:00
-- elapsed: 1.1s
-- outcome: success
-- dialect: snowflake
-- node_id: model.airline_and_rental_services.rental_model
-- query_id: 01c0c8b4-0001-76b8-0001-b35a000385da
-- desc: execute adapter call
create or replace transient  table demo_ask_db.demo_ask_schema.rental_model
    
    
    
    as (select
    _ID,
    CAR_TYPE, 
    DRIVERS, 
    EMAIL, 
    FIRST_NAME,
    LAST_NAME, 
    LICENSE_PLATE, 
    OPTIONS, 
    PRICE_USD, 
    RENTAL_ID, 
    RENTAL_INFO
from 
    demo_ask_db.rental.cars
    )

/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"airline_and_rental_services","target_name":"dev","node_id":"model.airline_and_rental_services.rental_model"} */;
-- created_at: 2025-12-02T15:48:18.201887+00:00
-- finished_at: 2025-12-02T15:48:18.246216+00:00
-- elapsed: 44ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.airline_and_rental_services.rental_model
-- query_id: 01c0c8b4-0001-76b3-0001-b35a000391d2
-- desc: not provided
use warehouse demo_ask_wh;
-- created_at: 2025-12-02T15:48:17.333934+00:00
-- finished_at: 2025-12-02T15:48:18.264369+00:00
-- elapsed: 930ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.airline_and_rental_services.airline_flights_model
-- query_id: 01c0c8b4-0001-76b8-0001-b35a000385de
-- desc: execute adapter call
create or replace transient  table demo_ask_db.demo_ask_schema.airline_flights_model
    
    
    
    as (select
    _ID,
    AGENT_EMAIL, 
    AGENT_FIRST_NAME, 
    AGENT_LAST_NAME, 
    DESTINATION, 
    DURATION_MINUTES, 
    EQUIPMENT, 
    FLIGHT_CODE, 
    FLIGHT_DATE, 
    FLIGHT_ID, 
    FLOW_PUBLISHED_AT, 
    GATE, 
    ORIGIN, 
    PASSENGERS, 
    SEATS_AVAILABLE    
from 
    demo_ask_db.airline.flights
    )

/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"airline_and_rental_services","target_name":"dev","node_id":"model.airline_and_rental_services.airline_flights_model"} */;
-- created_at: 2025-12-02T15:48:18.253369+00:00
-- finished_at: 2025-12-02T15:48:18.298129+00:00
-- elapsed: 44ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.airline_and_rental_services.intermediate_rental_drivers_split
-- query_id: 01c0c8b4-0001-76b8-0001-b35a000385e2
-- desc: not provided
use warehouse demo_ask_wh;
-- created_at: 2025-12-02T15:48:18.265090+00:00
-- finished_at: 2025-12-02T15:48:18.305400+00:00
-- elapsed: 40ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.airline_and_rental_services.airline_flights_model
-- query_id: 01c0c8b4-0001-76b8-0001-b35a000385e6
-- desc: not provided
use warehouse demo_ask_wh;
-- created_at: 2025-12-02T15:48:18.306331+00:00
-- finished_at: 2025-12-02T15:48:18.396650+00:00
-- elapsed: 90ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.airline_and_rental_services.intermediate_airline_flights_passengers
-- query_id: 01c0c8b4-0001-76b3-0001-b35a000391da
-- desc: not provided
use warehouse demo_ask_wh;
-- created_at: 2025-12-02T15:48:18.421544+00:00
-- finished_at: 2025-12-02T15:48:18.604036+00:00
-- elapsed: 182ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.airline_and_rental_services.intermediate_rental_info_model
-- query_id: 01c0c8b4-0001-76b8-0001-b35a000385ee
-- desc: execute adapter call
select distinct
            json.key as column_name
        from demo_ask_db.demo_ask_schema.rental_model,
        lateral flatten(input=>RENTAL_INFO) json
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"airline_and_rental_services","target_name":"dev","connection_name":""} */;
-- created_at: 2025-12-02T15:48:18.633495+00:00
-- finished_at: 2025-12-02T15:48:18.680571+00:00
-- elapsed: 47ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.airline_and_rental_services.intermediate_rental_info_model
-- query_id: 01c0c8b4-0001-76b8-0001-b35a000385f2
-- desc: not provided
use warehouse demo_ask_wh;
-- created_at: 2025-12-02T15:48:18.597677+00:00
-- finished_at: 2025-12-02T15:48:18.693416+00:00
-- elapsed: 95ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.airline_and_rental_services.intermediate_rental_options_model
-- query_id: 01c0c8b4-0001-76b3-0001-b35a000391de
-- desc: execute adapter call
select distinct
            json.key as column_name
        from demo_ask_db.demo_ask_schema.rental_model,
        lateral flatten(input=>OPTIONS) json
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"airline_and_rental_services","target_name":"dev","connection_name":""} */;
-- created_at: 2025-12-02T15:48:18.841550+00:00
-- finished_at: 2025-12-02T15:48:18.908367+00:00
-- elapsed: 66ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.airline_and_rental_services.intermediate_rental_options_model
-- query_id: 01c0c8b4-0001-76b8-0001-b35a000385f6
-- desc: not provided
use warehouse demo_ask_wh;
-- created_at: 2025-12-02T15:48:18.301061+00:00
-- finished_at: 2025-12-02T15:48:19.215955+00:00
-- elapsed: 914ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.airline_and_rental_services.intermediate_rental_drivers_split
-- query_id: 01c0c8b4-0001-76b3-0001-b35a000391d6
-- desc: execute adapter call
create or replace transient  table demo_ask_db.demo_ask_schema.intermediate_rental_drivers_split
    
    
    
    as (with source_data as (select
    _id,
    array_size(DRIVERS) as num_drivers
from demo_ask_db.demo_ask_schema.rental_model )

select 
    * 
from source_data

natural join ( select _ID,DRIVERS from demo_ask_db.demo_ask_schema.rental_model) as origin_data
    )

/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"airline_and_rental_services","target_name":"dev","node_id":"model.airline_and_rental_services.intermediate_rental_drivers_split"} */;
-- created_at: 2025-12-02T15:48:18.685315+00:00
-- finished_at: 2025-12-02T15:48:19.216967+00:00
-- elapsed: 531ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.airline_and_rental_services.intermediate_rental_info_model
-- query_id: 01c0c8b4-0001-76b3-0001-b35a000391e2
-- desc: execute adapter call
create or replace transient  table demo_ask_db.demo_ask_schema.intermediate_rental_info_model
    
    
    
    as (with source_model as (
    

    

    

    
        
    

    select
        
            _ID,
        
            RENTAL_ID,
        
            PRICE_USD,
        
            LICENSE_PLATE,
        
            LAST_NAME,
        
            FIRST_NAME,
        
            EMAIL,
        
            CAR_TYPE,
        
        
            RENTAL_INFO:rental_date as rental_date
            ,
        
            RENTAL_INFO:return_date as return_date
            ,
        
            RENTAL_INFO:pickup_location as pickup_location
            ,
        
            RENTAL_INFO:drop_off_location as drop_off_location
            
        
    from demo_ask_db.demo_ask_schema.rental_model


)

select 
    *
from source_model
    )

/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"airline_and_rental_services","target_name":"dev","node_id":"model.airline_and_rental_services.intermediate_rental_info_model"} */;
-- created_at: 2025-12-02T15:48:19.216836+00:00
-- finished_at: 2025-12-02T15:48:19.268131+00:00
-- elapsed: 51ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.airline_and_rental_services.intermediate_rental_drivers_split
-- query_id: 01c0c8b4-0001-76b8-0001-b35a000385fa
-- desc: not provided
use warehouse demo_ask_wh;
-- created_at: 2025-12-02T15:48:19.217644+00:00
-- finished_at: 2025-12-02T15:48:19.269136+00:00
-- elapsed: 51ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.airline_and_rental_services.intermediate_rental_info_model
-- query_id: 01c0c8b4-0001-76b3-0001-b35a000391ea
-- desc: not provided
use warehouse demo_ask_wh;
-- created_at: 2025-12-02T15:48:18.399960+00:00
-- finished_at: 2025-12-02T15:48:19.315334+00:00
-- elapsed: 915ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.airline_and_rental_services.intermediate_airline_flights_passengers
-- query_id: 01c0c8b4-0001-76b8-0001-b35a000385ea
-- desc: execute adapter call
create or replace transient  table demo_ask_db.demo_ask_schema.intermediate_airline_flights_passengers
    
    
    
    as (with tmp_table as (
    select
        * 
    from 
        demo_ask_db.demo_ask_schema.airline_flights_model,
        lateral flatten(input=>PASSENGERS) as json
)

select     
    _ID,
    AGENT_EMAIL, 
    AGENT_FIRST_NAME, 
    AGENT_LAST_NAME, 
    DESTINATION, 
    DURATION_MINUTES, 
    EQUIPMENT, 
    FLIGHT_CODE, 
    FLIGHT_DATE, 
    FLIGHT_ID, 
    FLOW_PUBLISHED_AT, 
    GATE, 
    ORIGIN, 
    VALUE,
    SEATS_AVAILABLE 
from tmp_table
    )

/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"airline_and_rental_services","target_name":"dev","node_id":"model.airline_and_rental_services.intermediate_airline_flights_passengers"} */;
-- created_at: 2025-12-02T15:48:19.316122+00:00
-- finished_at: 2025-12-02T15:48:19.364329+00:00
-- elapsed: 48ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.airline_and_rental_services.intermediate_airline_flights_passengers
-- query_id: 01c0c8b4-0001-76b3-0001-b35a000391ee
-- desc: not provided
use warehouse demo_ask_wh;
-- created_at: 2025-12-02T15:48:18.913294+00:00
-- finished_at: 2025-12-02T15:48:19.444879+00:00
-- elapsed: 531ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.airline_and_rental_services.intermediate_rental_options_model
-- query_id: 01c0c8b4-0001-76b3-0001-b35a000391e6
-- desc: execute adapter call
create or replace transient  table demo_ask_db.demo_ask_schema.intermediate_rental_options_model
    
    
    
    as (with source_model as (
    

    

    

    
        
    

    select
        
            _ID,
        
            RENTAL_ID,
        
            PRICE_USD,
        
            LICENSE_PLATE,
        
            LAST_NAME,
        
            FIRST_NAME,
        
            EMAIL,
        
            CAR_TYPE,
        
        
            OPTIONS:extra_driver as extra_driver
            ,
        
            OPTIONS:gps as gps
            ,
        
            OPTIONS:child_seat as child_seat
            ,
        
            OPTIONS:insurance as insurance
            
        
    from demo_ask_db.demo_ask_schema.rental_model


)

select 
    *
from source_model
    )

/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"airline_and_rental_services","target_name":"dev","node_id":"model.airline_and_rental_services.intermediate_rental_options_model"} */;
-- created_at: 2025-12-02T15:48:19.445665+00:00
-- finished_at: 2025-12-02T15:48:19.499661+00:00
-- elapsed: 53ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.airline_and_rental_services.intermediate_rental_options_model
-- query_id: 01c0c8b4-0001-76b8-0001-b35a000385fe
-- desc: not provided
use warehouse demo_ask_wh;
-- created_at: 2025-12-02T15:48:19.367029+00:00
-- finished_at: 2025-12-02T15:48:19.546372+00:00
-- elapsed: 179ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.airline_and_rental_services.intermediate_airline_flights_passenger
-- query_id: 01c0c8b4-0001-76b3-0001-b35a000391f2
-- desc: execute adapter call
select distinct
            json.key as column_name
        from demo_ask_db.demo_ask_schema.intermediate_airline_flights_passengers,
        lateral flatten(input=>VALUE) json
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"airline_and_rental_services","target_name":"dev","connection_name":""} */;
-- created_at: 2025-12-02T15:48:19.500738+00:00
-- finished_at: 2025-12-02T15:48:19.559490+00:00
-- elapsed: 58ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.airline_and_rental_services.marts_rental_orders_summary
-- query_id: 01c0c8b4-0001-76b3-0001-b35a000391f6
-- desc: not provided
use warehouse demo_ask_wh;
-- created_at: 2025-12-02T15:48:19.564138+00:00
-- finished_at: 2025-12-02T15:48:19.607948+00:00
-- elapsed: 43ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.airline_and_rental_services.intermediate_airline_flights_passenger
-- query_id: 01c0c8b4-0001-76b3-0001-b35a000391fa
-- desc: not provided
use warehouse demo_ask_wh;
-- created_at: 2025-12-02T15:48:19.610946+00:00
-- finished_at: 2025-12-02T15:48:20.442335+00:00
-- elapsed: 831ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.airline_and_rental_services.intermediate_airline_flights_passenger
-- query_id: 01c0c8b4-0001-76b8-0001-b35a00038602
-- desc: execute adapter call
create or replace transient  table demo_ask_db.demo_ask_schema.intermediate_airline_flights_passenger
    
    
    
    as (with source_model as (
    

    

    

    
        
    

    select
        
            _ID,
        
            ORIGIN,
        
            DESTINATION,
        
            AGENT_FIRST_NAME,
        
            AGENT_LAST_NAME,
        
            AGENT_EMAIL,
        
            DURATION_MINUTES,
        
            FLIGHT_CODE,
        
            FLIGHT_ID,
        
            FLIGHT_DATE,
        
            GATE,
        
        
            VALUE:name as name
            ,
        
            VALUE:passenger_id as passenger_id
            ,
        
            VALUE:ticket_number as ticket_number
            ,
        
            VALUE:seat_number as seat_number
            
        
    from demo_ask_db.demo_ask_schema.intermediate_airline_flights_passengers


)

select 
    *
from source_model
    )

/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"airline_and_rental_services","target_name":"dev","node_id":"model.airline_and_rental_services.intermediate_airline_flights_passenger"} */;
-- created_at: 2025-12-02T15:48:20.443066+00:00
-- finished_at: 2025-12-02T15:48:20.492174+00:00
-- elapsed: 49ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.airline_and_rental_services.intermediate_airline_flights_passenger
-- query_id: 01c0c8b4-0001-76b8-0001-b35a00038606
-- desc: not provided
use warehouse demo_ask_wh;
-- created_at: 2025-12-02T15:48:20.493295+00:00
-- finished_at: 2025-12-02T15:48:20.536508+00:00
-- elapsed: 43ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.airline_and_rental_services.marts_airline_flights_summary
-- query_id: 01c0c8b4-0001-76b3-0001-b35a00039202
-- desc: not provided
use warehouse demo_ask_wh;
-- created_at: 2025-12-02T15:48:20.540917+00:00
-- finished_at: 2025-12-02T15:48:21.279653+00:00
-- elapsed: 738ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.airline_and_rental_services.marts_airline_flights_summary
-- query_id: 01c0c8b4-0001-76b8-0001-b35a0003860a
-- desc: execute adapter call
create or replace transient  table demo_ask_db.demo_ask_schema.marts_airline_flights_summary
    
    
    
    as (select
    _ID, 
    ORIGIN,
    DESTINATION,
    AGENT_FIRST_NAME,
    AGENT_LAST_NAME,
    FLIGHT_CODE,
    FLIGHT_ID,
    FLIGHT_DATE,
    GATE,
    TICKET_NUMBER,
    SEAT_NUMBER,
    split_part(NAME,' ',1) as PASSENGER_FIRST_NAME,
    split_part(NAME,' ',2) as PASSENGER_LAST_NAME
from
    demo_ask_db.demo_ask_schema.intermediate_airline_flights_passenger
    )

/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"airline_and_rental_services","target_name":"dev","node_id":"model.airline_and_rental_services.marts_airline_flights_summary"} */;
-- created_at: 2025-12-02T15:48:21.280374+00:00
-- finished_at: 2025-12-02T15:48:21.321067+00:00
-- elapsed: 40ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.airline_and_rental_services.marts_airline_flights_summary
-- query_id: 01c0c8b4-0001-76b3-0001-b35a00039206
-- desc: not provided
use warehouse demo_ask_wh;
-- created_at: 2025-12-02T15:48:19.563451+00:00
-- finished_at: 2025-12-02T15:48:23.823865+00:00
-- elapsed: 4.3s
-- outcome: success
-- dialect: snowflake
-- node_id: model.airline_and_rental_services.marts_rental_orders_summary
-- query_id: 01c0c8b4-0001-76b3-0001-b35a000391fe
-- desc: execute adapter call
create or replace transient  table demo_ask_db.demo_ask_schema.marts_rental_orders_summary
    
    
    
    as (select  
    _ID,
    RENTAL_ID,
    PRICE_USD,
    LICENSE_PLATE,
    LAST_NAME as CUSTOMER_LAST_NAME,
    FIRST_NAME as CUSTOMER_FIRST_NAME,
    EMAIL,
    CAR_TYPE,
    RENTAL_DATE,
    RETURN_DATE,
    PICKUP_LOCATION,
    DROP_OFF_LOCATION,
    EXTRA_DRIVER, 
    GPS, 
    CHILD_SEAT,
    INSURANCE
from 
    demo_ask_db.demo_ask_schema.intermediate_rental_info_model as rental_info
natural join (
    select EXTRA_DRIVER, GPS, CHILD_SEAT,INSURANCE from demo_ask_db.demo_ask_schema.intermediate_rental_options_model as rental_options
)
    )

/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"airline_and_rental_services","target_name":"dev","node_id":"model.airline_and_rental_services.marts_rental_orders_summary"} */;
-- created_at: 2025-12-02T15:48:23.824575+00:00
-- finished_at: 2025-12-02T15:48:23.869449+00:00
-- elapsed: 44ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.airline_and_rental_services.marts_rental_orders_summary
-- query_id: 01c0c8b4-0001-76b8-0001-b35a0003860e
-- desc: not provided
use warehouse demo_ask_wh;
-- created_at: 2025-12-02T15:48:23.870721+00:00
-- finished_at: 2025-12-02T15:48:23.913113+00:00
-- elapsed: 42ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.airline_and_rental_services.marts_airline_and_rental_summary
-- query_id: 01c0c8b4-0001-76b3-0001-b35a0003920a
-- desc: not provided
use warehouse demo_ask_wh;
