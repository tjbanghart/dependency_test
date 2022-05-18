include: "/explores/dependencies.explore.lkml"
include: "/views/repositories.view.lkml"
include: "/analysis/**/*.view.lkml"

explore: dependencies_with_repository {
  extends: [dependencies]
  join: repositories {
    sql_on: ${projects.repository_id} = ${repositories.id} ;;
    relationship: one_to_many
  }
  join: top_n_by_language {
    type: inner
    relationship: many_to_one
    sql_on: ${repositories.language} = ${top_n_by_language.language} ;;
  }
}

# Place in `dependency_demo` model
explore: +dependencies_with_repository {
  aggregate_table: rollup__projects_latest_release_publish_timestamp_date {
    query: {
      dimensions: [projects.latest_release_publish_timestamp_date]
      measures: [
        projects.average_java_dependent_project,
        projects.avg_dependent_projects,
        projects.avg_dependent_repos,
        projects.count,
        projects.sum_dependent_projects,
        projects.sum_dependent_repositories,
        projects.sum_java_dependent_project
      ]
    }
    materialization: {
      datagroup_trigger: dependency_default_datagroup
    }
  }
}
