include: "/explores/dependencies.explore.lkml"
include: "/views/repositories.view.lkml"

explore: dependencies_with_repository {
  extends: [dependencies]
  join: repositories {
    sql_on: ${projects.repository_id} = ${repositories.id} ;;
    relationship: one_to_many
  }
}
