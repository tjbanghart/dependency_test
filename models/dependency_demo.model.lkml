connection: "bigquery_standard"

# include all the views
include: "/views/**/*.view"
include: "/custom/**/*.lkml"

datagroup: dependency_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM `bigquery-public-data.libraries_io.versions`;;
  max_cache_age: "1 hour"
}

persist_with: dependency_default_datagroup
