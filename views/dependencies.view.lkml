view: dependencies {
  sql_table_name: `bigquery-public-data.libraries_io.dependencies`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    description: "The unique primary key of the dependency in the Libraries.io database."
    sql: ${TABLE}.id ;;
  }

  dimension: dependency_kind {
    type: string
    description: "The type of dependency, often declared for the phase of usage, e.g. runtime, test, development, build."
    sql: ${TABLE}.dependency_kind ;;
  }

  dimension: dependency_name {
    type: string
    description: "The name of the project that the dependency specifies."
    sql: ${TABLE}.dependency_name ;;
  }

  dimension: dependency_platform {
    type: string
    description: "The name of the package manager that the project that the dependency specifies is available from (only different for Atom)."
    sql: ${TABLE}.dependency_platform ;;
  }

  dimension: dependency_project_id {
    type: number
    description: "The unique primary key of the project for this dependency in the Libraries.io database."
    sql: ${TABLE}.dependency_project_id ;;
  }

  dimension: dependency_requirements {
    type: string
    description: "The version or range of versions that the dependency specifies, resolution of that to a particular version is package manager specific."
    sql: ${TABLE}.dependency_requirements ;;
  }

  dimension: optional_dependency {
    type: string
    description: "Is the dependency optional?."
    sql: ${TABLE}.optional_dependency ;;
  }

  dimension: platform {
    type: string
    description: "The name of the Package manager the dependency is available on."
    sql: ${TABLE}.platform ;;
  }

  dimension: project_id {
    type: number
    description: "The unique primary key of the project for this dependency in the Libraries.io database."
    # hidden: yes
    sql: ${TABLE}.project_id ;;
  }

  dimension: project_name {
    type: string
    description: "The name of the project the dependency belongs to."
    sql: ${TABLE}.project_name ;;
  }

  dimension: version_id {
    type: number
    description: "The unique primary key of the version for this dependency in the Libraries.io database."
    # hidden: yes
    sql: ${TABLE}.version_id ;;
  }

  dimension: version_number {
    type: string
    description: "The number of the version that the dependency belongs to."
    sql: ${TABLE}.version_number ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      dependency_name,
      project_name,
      projects.name,
      projects.id,
      versions.id,
      versions.project_name
    ]
  }
}
