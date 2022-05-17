connection: "bigquery_standard"

# include all the views
include: "/views/**/*.view"

datagroup: dependency_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: dependency_default_datagroup