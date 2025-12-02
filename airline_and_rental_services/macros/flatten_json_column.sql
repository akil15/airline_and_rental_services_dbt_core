{% macro flatten_json_column(model_name,json_column) %}

    {% set json_column_query %}
        select distinct
            json.key as column_name
        from {{model_name}},
        lateral flatten(input=>{{json_column}}) json
    {% endset%}

    {% set results = run_query(json_column_query) %}

    {% if execute %}
        {% set results_list = results.columns[0].values() %}
    {% else %}
        {% set results_list = [] %}
    {% endif %}

    select 
        _ID,
        {% for column_name in results_list %}
            {{json_column}}:{{column_name}}::VARCHAR as {{column_name}}
            {% if not loop.last %},{% endif %}
        {% endfor %}
    from
        {{ model_name }}

{% endmacro %}