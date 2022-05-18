view: versions {
  sql_table_name: `bigquery-public-data.libraries_io.versions`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    description: "The unique primary key of the version in the Libraries.io database."
    sql: ${TABLE}.id ;;
  }

  dimension_group: created_timestamp {
    type: time
    description: "The timestamp of when the version was first detected by Libraries.io."
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

  dimension: number {
    type: string
    description: "The number of the release, often confirms to semantic versioning."
    sql: ${TABLE}.number ;;
  }

  dimension: platform {
    type: string
    description: "The name of the Package manager the version is available on."
    sql: ${TABLE}.platform ;;
  }

  dimension: project_id {
    type: number
    description: "The unique primary key of the project for this version in the Libraries.io database."
    # hidden: yes
    sql: ${TABLE}.project_id ;;
  }

  dimension: project_name {
    type: string
    description: "The name of the project the version belongs to."
    sql: ${TABLE}.project_name ;;
  }

  dimension_group: published_timestamp {
    type: time
    description: "The timestamp of when the version was published."
    timeframes: [raw]
    sql: ${TABLE}.published_timestamp ;;
  }

  dimension_group: updated_timestamp {
    type: time
    description: "The timestamp of when the version was last saved by Libraries.io."
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

  measure: count {
    type: count
    drill_fields: [id, project_name, projects.name, projects.id, dependencies.count]
  }
}
