view: repository_dependencies {
  sql_table_name: `bigquery-public-data.libraries_io.repository_dependencies`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    description: "The unique primary key of the repository dependency in the Libraries.io database."
    sql: ${TABLE}.id ;;
  }

  dimension: dependency_kind {
    type: string
    description: "The type of dependency, often declared for the phase of usage, e.g. runtime, test, development, build."
    sql: ${TABLE}.dependency_kind ;;
  }

  dimension: dependency_project_id {
    type: number
    description: "The unique primary key of the project for this dependency in the Libraries.io database."
    sql: ${TABLE}.dependency_project_id ;;
  }

  dimension: dependency_project_name {
    type: string
    description: "The name of the project that the dependency specifies."
    sql: ${TABLE}.dependency_project_name ;;
  }

  dimension: dependency_requirements {
    type: string
    description: "The version or range of versions that the dependency specifies, resolution of that to a particular version is package manager specific."
    sql: ${TABLE}.dependency_requirements ;;
  }

  dimension: git_branch {
    type: string
    description: "Which branch was the manifest loaded from the repository."
    sql: ${TABLE}.git_branch ;;
  }

  dimension: host_type {
    type: string
    description: "Which website the dependencys repository is hosted on, either GitHub, GitLab or Bitbucket."
    sql: ${TABLE}.host_type ;;
  }

  dimension: manifest_filepath {
    type: string
    description: "Path to the file where the dependency is declared within the repository."
    sql: ${TABLE}.manifest_filepath ;;
  }

  dimension: manifest_kind {
    type: string
    description: "Either manifest or lockfile, manifests are written by humans, lockfiles contain full resolved dependency tree."
    sql: ${TABLE}.manifest_kind ;;
  }

  dimension: manifest_platform {
    type: string
    description: "Which package manager the dependency listed in the manifest should use."
    sql: ${TABLE}.manifest_platform ;;
  }

  dimension: optional {
    type: string
    description: "Is the dependency optional?."
    sql: ${TABLE}.optional ;;
  }

  dimension: repository_id {
    type: number
    description: "The unique primary key of the repository for this dependency in the Libraries.io database."
    sql: ${TABLE}.repository_id ;;
  }

  dimension: repository_name_with_owner {
    type: string
    description: "The repository name and owner seperated by a slash, also maps to the url slug on the given repository host e.g. librariesio/libraries.io."
    sql: ${TABLE}.repository_name_with_owner ;;
  }

  measure: count {
    type: count
    drill_fields: [id, dependency_project_name]
  }
}
