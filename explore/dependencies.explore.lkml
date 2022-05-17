include: "/views/dependencies.view.lkml"
include: "/views/projects.view.lkml"
include: "/views/versions.view.lkml"

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
