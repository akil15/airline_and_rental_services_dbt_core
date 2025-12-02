# Data Pipelining with dbt Core, Snowflake and Census

## Configuring your MongoDB workload generator

Retrieve the following repo [MongoDB workload generator by Percona Lab](https://github.com/Percona-Lab/mongoDB-workload-generator/tree/main) and update it accordingly with your MongoDB Atlas parameters.

## Configuring your data ingestion tool

You can use Fivetran here as an ELT platform.

The details as to how to set it up is availble on the documentation portal.

[MongoDB Fivetran documentation](https://fivetran.com/docs/connectors/databases/mongodb)

[Snowflake Fivetran documentation](https://fivetran.com/docs/connectors/databases/snowflake)

## Installing dbt Core on MacOS

We will start off by installing and configuring our dbt project.

Issue the following commands to do so in a folder named airplane_and_rental_services.
```bash
% cd airline_and_rental_services
% python3 -m venv env
% source env/bin/activate
% python3 -m pip install dbt-core dbt-snowflake
% dbt init --project-name airline_and_rental_services
```

After entering dbt init, you will be prompted for the following details:
- adapter type: Snowflake
- Account: YOUR_SNOWFLAKE_ACCOUNT
- user: YOUR_SNOWFLAKE_USERNAME
- database: demo_ask_db
- warehouse: demo_ask_wh
- schema: demo_ask_schema
- role (optional): demo_ask_role

Retrieve the following GitHub repo which contains all the transformation that will be applied on your Snowflake source data warehouse:
[airline_and_rental_services_dbt_core](https://github.com/akil15/airline_and_rental_services_dbt_core.git)


Then from whithin that project, launch VS Code and issue the latter command to init/install your dbt project packages (if missing or looking to update)
```bash
% code .
% dbt deps
% dbt build
```

## Configuring Snowflake warehouse

Issue the following SQL commands in your Snowflake worksheet.

This will create the required variables like warehouse, database, role, user to be used during the execution of our models.
```sql
USE ROLE accountadmin;
CREATE WAREHOUSE demo_ask_wh WITH warehouse_size='xsmall';
CREATE DATABASE IF NOT EXISTS demo_ask_db;
CREATE ROLE IF NOT EXISTS demo_ask_role;
GRANT USAGE ON WAREHOUSE demo_ask_wh TO ROLE demo_ask_role;
GRANT OWNERSHIP ON DATABASE demo_ask_db TO ROLE demo_ask_role;
GRANT ROLE demo_ask_role TO USER akilsalhab;
```

## Leveraging Census Reverse ETL

Go and get a free trial Census account here: [Census Reverse ETL, now in Real Time](https://www.getcensus.com/reverse-etl).

Setup Census to activate your data.

1. Add a source by connecting your data warehouse (i.e. Snowflake), here is a list of required information.
   - Snowflake account name
   - query execution warehouse (i.e. demo_ask_wh)
   - user
   - password

2. Add a destination by connecting your MongoDB database, here is a list of required information - note that the database and collection have to be created beforehand.
   - name
   - connection string
   - database name

3. Create a sync to send record from Snowflake to Census by filling out the following details.
   - source database (i.e. demo_ask_db)
   - source schema (i.e. demo_ask_schema)
   - source table (i.e. marts_airline_and_rental_aggregated_view_per_passenger)
   - destination object (i.e. collection1)
   - sync key (i.e. source table column name = surrogate_keys) mapped to _id
   - sync all columns

4. Select the trigger frequency as manual (we can later change that option and select continuous).

# Conclusion

As part of that demonstration, the last step would be to fully orchestrate it.

You could ingest the data source by contiuously retrieving the data and load it into Snowflake and then trigger the data models' execution by leveraging dbt.

Having said that, it would then make sense to update the Census configuration and set it up to continuous behaviour.
