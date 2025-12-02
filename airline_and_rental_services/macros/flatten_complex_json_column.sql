{% macro flatten_complex_json_column(model_name,json_column,column_list) %}

    {% set complex_json_column_query %}
        select distinct
            json.key as column_name
        from {{model_name}},
        lateral flatten(input=>{{json_column}}) json
    {% endset %}

    {% set results = run_query(complex_json_column_query) %}

    {% if execute %}
        {% set results_list = results.columns[0].values() %}
    {% else %}
        {% set results_list = [] %}
    {% endif %}

    select
        {% for column in column_list %}
            {{column}},
        {% endfor %}
        {% for column_name in results_list %}
            {{json_column}}:{{column_name}} as {{column_name}}
            {% if not loop.last %},{% endif %}
        {% endfor %}
    from {{model_name}}

{% endmacro %}