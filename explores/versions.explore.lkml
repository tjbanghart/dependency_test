include: "/views/versions.view.lkml"
include: "/views/projects.view.lkml"

explore: versions {
  join: projects {
    type: left_outer
    sql_on: ${versions.project_id} = ${projects.id} ;;
    relationship: many_to_one
  }
}
