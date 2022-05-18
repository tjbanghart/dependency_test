include: "/views/dependencies.view.lkml"
include: "/views/projects.view.lkml"
include: "/views/versions.view.lkml"


# https://gcps228.cloud.looker.com/explore/dependency_demo/dependencies?qid=uVfGo3nICfaVqeMhwalD9w
explore: dependencies {
  view_name: dependencies
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
