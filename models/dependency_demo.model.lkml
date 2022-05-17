connection: "bigquery_standard"

# include all the views
include: "/views/**/*.view"

datagroup: dependency_demo_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: dependency_demo_default_datagroup

explore: dependencies {
  join: projects {
    type: left_outer
    sql_on: ${dependencies.project_id} = ${projects.id} ;;
    relationship: many_to_one
  }

  join: versions {
    type: left_outer
    sql_on: ${dependencies.version_id} = ${versions.id} ;;
    relationship: many_to_one
  }
}

explore: repositories {}

explore: projects {}

explore: versions {
  join: projects {
    type: left_outer
    sql_on: ${versions.project_id} = ${projects.id} ;;
    relationship: many_to_one
  }
}

explore: repository_dependencies {}

explore: tags {}

explore: projects_with_repository_fields {}
