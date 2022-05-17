view: projects {
  sql_table_name: `bigquery-public-data.libraries_io.projects`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    description: "The unique primary key of the project in the Libraries.io database."
    sql: ${TABLE}.id ;;
  }

  dimension_group: created_timestamp {
    type: time
    description: "The timestamp of when Libraries.io first discovered the project."
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_timestamp ;;
  }

  dimension: dependent_projects_count {
    type: number
    description: "Number of other projects that declare the project as a dependency in one or more of their versions."
    sql: ${TABLE}.dependent_projects_count ;;
  }

  dimension: dependent_repositories_count {
    type: number
    description: "The total count of open source repositories that list the project as a dependency as detected by Libraries.io."
    sql: ${TABLE}.dependent_repositories_count ;;
  }

  dimension: description {
    type: string
    description: "Description provided by the package manager, falling back to description from repository if empty."
    sql: ${TABLE}.description ;;
  }

  dimension: homepage_url {
    type: string
    description: "URL of webpage or repository as provided by package managers that support it."
    sql: ${TABLE}.homepage_url ;;
  }

  dimension: keywords {
    type: string
    description: "Comma separated array of keywords if supported by package manager."
    sql: ${TABLE}.keywords ;;
  }

  dimension: language {
    type: string
    description: "Primary programming language the project is written in, pulled from the repository if source is hosted on GitHub."
    sql: ${TABLE}.language ;;
  }

  dimension_group: last_synced_timestamp {
    type: time
    description: "Timestamp of when Libraries.io last synced the project from it's package manager API."
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.last_synced_timestamp ;;
  }

  dimension: latest_release_number {
    type: string
    description: "Version number of the latest release detected by Libraries.io (ordered by semver, falling back to publish date for invalid semver)."
    sql: ${TABLE}.latest_release_number ;;
  }

  dimension_group: latest_release_publish_timestamp {
    type: time
    description: "Time of the latest release detected by Libraries.io (ordered by semver, falling back to publish date for invalid semver)."
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.latest_release_publish_timestamp ;;
  }

  dimension: licenses {
    type: string
    description: "Comma separated array of SPDX identifiers for licenses declared in package manager meta data or submitted manually by Libraries.io user via \"project suggection\" feature."
    sql: ${TABLE}.licenses ;;
  }

  dimension: name {
    type: string
    description: "The name of the project, unique by Platform (case sensitive)."
    sql: ${TABLE}.name ;;
  }

  dimension: package_manager_id {
    type: number
    description: "Unique ID of project from package manager API, only currently used by PlatformIO."
    sql: ${TABLE}.package_manager_id ;;
  }

  dimension: platform {
    type: string
    description: "The name of the Package manager the project is available on."
    sql: ${TABLE}.platform ;;
  }

  dimension: repository_id {
    type: number
    description: "The unique primary key of the repository for this project in the Libraries.io database."
    sql: ${TABLE}.repository_id ;;
  }

  dimension: repository_url {
    type: string
    description: "URL of source code repository declared in package manager metadata or submitted manually by Libraries.io user via \"project suggection\" feature."
    sql: ${TABLE}.repository_url ;;
  }

  dimension: sourcerank {
    type: number
    description: "Libraries.io defined score based on quality, popularity and community metrics."
    sql: ${TABLE}.sourcerank ;;
  }

  dimension: status {
    type: string
    description: "Either Active, Deprecated, Unmaintained, Help Wanted, Removed, no value also means active. Updated when detected by Libraries.io or submitted manually by Libraries.io user via \"project suggection\" feature."
    sql: ${TABLE}.status ;;
  }

  dimension_group: updated_timestamp {
    type: time
    description: "The timestamp of when Libraries.io last saved a change to the project."
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.updated_timestamp ;;
  }

  dimension: versions_count {
    type: number
    description: "Number of published versions of the project found by Libraries.io."
    sql: ${TABLE}.versions_count ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, dependencies.count, versions.count]
  }
}
