-- created_at: 2025-12-02T14:42:44.700414+00:00
-- finished_at: 2025-12-02T14:42:45.210815+00:00
-- elapsed: 510ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.airline_and_rental_services.intermediate_rental_info_model
-- query_id: 01c0c872-0001-76b3-0001-b35a00039126
-- desc: execute adapter call
select distinct
            json.key as column_name
        from demo_ask_db.demo_ask_schema.rental_model,
        lateral flatten(input=>RENTAL_INFO) json
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"airline_and_rental_services","target_name":"dev","connection_name":""} */;
-- created_at: 2025-12-02T14:42:44.514549+00:00
-- finished_at: 2025-12-02T14:42:45.210811+00:00
-- elapsed: 696ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.airline_and_rental_services.intermediate_airline_flights_passenger
-- query_id: 01c0c872-0001-76b3-0001-b35a00039122
-- desc: execute adapter call
select distinct
            json.key as column_name
        from demo_ask_db.demo_ask_schema.intermediate_airline_flights_passengers,
        lateral flatten(input=>VALUE) json
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"airline_and_rental_services","target_name":"dev","connection_name":""} */;
-- created_at: 2025-12-02T14:42:45.100684+00:00
-- finished_at: 2025-12-02T14:42:45.246188+00:00
-- elapsed: 145ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.airline_and_rental_services.intermediate_rental_options_model
-- query_id: 01c0c872-0001-76b3-0001-b35a0003912a
-- desc: execute adapter call
select distinct
            json.key as column_name
        from demo_ask_db.demo_ask_schema.rental_model,
        lateral flatten(input=>OPTIONS) json
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"airline_and_rental_services","target_name":"dev","connection_name":""} */;
