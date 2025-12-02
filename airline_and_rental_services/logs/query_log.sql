-- created_at: 2025-12-02T14:44:49.463823+00:00
-- finished_at: 2025-12-02T14:44:49.540136+00:00
-- elapsed: 76ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.airline_and_rental_services.intermediate_rental_info_model
-- query_id: 01c0c874-0001-76b3-0001-b35a00039142
-- desc: execute adapter call
select distinct
            json.key as column_name
        from demo_ask_db.demo_ask_schema.rental_model,
        lateral flatten(input=>RENTAL_INFO) json
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"airline_and_rental_services","target_name":"dev","connection_name":""} */;
-- created_at: 2025-12-02T14:44:49.919058+00:00
-- finished_at: 2025-12-02T14:44:49.990936+00:00
-- elapsed: 71ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.airline_and_rental_services.intermediate_airline_flights_passenger
-- query_id: 01c0c874-0001-76b3-0001-b35a00039146
-- desc: execute adapter call
select distinct
            json.key as column_name
        from demo_ask_db.demo_ask_schema.intermediate_airline_flights_passengers,
        lateral flatten(input=>VALUE) json
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"airline_and_rental_services","target_name":"dev","connection_name":""} */;
-- created_at: 2025-12-02T14:44:50.034290+00:00
-- finished_at: 2025-12-02T14:44:50.109684+00:00
-- elapsed: 75ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.airline_and_rental_services.intermediate_rental_options_model
-- query_id: 01c0c874-0001-76b8-0001-b35a0003856e
-- desc: execute adapter call
select distinct
            json.key as column_name
        from demo_ask_db.demo_ask_schema.rental_model,
        lateral flatten(input=>OPTIONS) json
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"airline_and_rental_services","target_name":"dev","connection_name":""} */;
