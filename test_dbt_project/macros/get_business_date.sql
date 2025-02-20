{% macro get_business_date() %}
    {% set query %}
        select strftime(business_date, '''%Y-%m-%d''') from {{ref('batchcurr')}}
    {% endset %}
    
    {% set results = run_query(query) %}
    
    {% if execute %}
        {% set business_date = results.columns[0][0] %}
    {% else %}
        {% set business_date = none %}
    {% endif %}
    
    {{ return(business_date) }}
{% endmacro %}
