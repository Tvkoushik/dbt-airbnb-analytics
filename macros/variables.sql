{% macro learn_variables() %}
    {% set name = "tvkou" %} {{ log("Hello " ~ name, info=True) }}
    {{ log("Gender is " ~ var("gender", default="male"), info=True) }}
{% endmacro %}
