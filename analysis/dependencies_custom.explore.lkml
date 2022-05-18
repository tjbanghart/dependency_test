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
