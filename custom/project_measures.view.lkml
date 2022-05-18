include: "/views/projects.view.lkml"

view: +projects {
  measure: avg_dependent_projects {
    type: average
    description: "Average of other projects that declare the project as a dependency in one or more of their versions."
    sql: ${dependent_projects_count} ;;
  }
  measure: avg_dependent_repos {
    type: average
    description: "The average count of open source repositories that list the project as a dependency as detected by Libraries.io."
    sql: ${dependent_repositories_count} ;;
  }
  measure: sum_dependent_projects {
    type: sum
    description: "Sum of other projects that declare the project as a dependency in one or more of their versions."
    sql: ${dependent_projects_count} ;;
  }
  measure: sum_dependent_repositories {
    type: sum
    description: "The sum of open source repositories that list the project as a dependency as detected by Libraries.io."
    sql: ${dependent_repositories_count} ;;
  }
  measure: average_java_dependent_project {
    type: average
    sql: ${dependent_projects_count} ;;
    filters: [language: "Java"]
  }
  measure: sum_java_dependent_project {
    type: sum
    sql: ${dependent_projects_count} ;;
    filters: [language: "Java"]
  }
  measure: percent_java_projects {
    type: number
    sql: SAFE_DIVIDE(${sum_java_dependent_project}, ${sum_dependent_projects}) ;;
  }
}
