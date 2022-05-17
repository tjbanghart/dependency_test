view: tags {
  sql_table_name: `bigquery-public-data.libraries_io.tags`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    description: "The unique primary key of the tag in the Libraries.io database."
    sql: ${TABLE}.id ;;
  }

  dimension: host_type {
    type: string
    description: "Which website the tags repository is hosted on, either GitHub, GitLab or Bitbucket."
    sql: ${TABLE}.host_type ;;
  }

  dimension: repository_id {
    type: number
    description: "The unique primary key of the repository for this tag in the Libraries.io database."
    sql: ${TABLE}.repository_id ;;
  }

  dimension: repository_name_with_owner {
    type: string
    description: "The repository name and owner seperated by a slash, also maps to the url slug on the given repository host e.g. librariesio/libraries.io."
    sql: ${TABLE}.repository_name_with_owner ;;
  }

  dimension_group: tag_created_timestamp {
    type: time
    description: "The timestamp of when the tag was first saved by Libraries.io."
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.tag_created_timestamp ;;
  }

  dimension: tag_git_sha {
    type: string
    description: "Sha of the object that the tag is pointing at in the repository."
    sql: ${TABLE}.tag_git_sha ;;
  }

  dimension: tag_name {
    type: string
    description: "The name of the tag, often is a version number but could be any freeform string."
    sql: ${TABLE}.tag_name ;;
  }

  dimension_group: tag_published_timestamp {
    type: time
    description: "The timestamp of when the tag was published."
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.tag_published_timestamp ;;
  }

  dimension_group: tag_updated_timestamp {
    type: time
    description: "The timestamp of when the tag was last saved by Libraries.io."
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.tag_updated_timestamp ;;
  }

  measure: count {
    type: count
    drill_fields: [id, tag_name]
  }
}
