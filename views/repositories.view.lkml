view: repositories {
  sql_table_name: `bigquery-public-data.libraries_io.repositories`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    description: "he unique primary key of the repository in the Libraries.io database."
    sql: ${TABLE}.id ;;
  }

  dimension: an {
    type: string
    sql: ${TABLE}.an ;;
  }

  dimension: changelog_filename {
    type: string
    description: "If a changelog file has been detected, the full name of the changelog file, e.g changelog.txt."
    sql: ${TABLE}.changelog_filename ;;
  }

  dimension: code_of_conduct_filename {
    type: string
    description: "If a code of conduct file has been detected, the full name of the code of conduct file, e.g code_of_conduct.md."
    sql: ${TABLE}.code_of_conduct_filename ;;
  }

  dimension: contributing_guidelines_filename {
    type: string
    description: "If a contributing guidelines file has been detected, the full name of the contributing guidelines file, e.g contributing.md."
    sql: ${TABLE}.contributing_guidelines_filename ;;
  }

  dimension: contributors_count {
    type: number
    description: "Number of unique contributors that have committed to the default branch."
    sql: ${TABLE}.contributors_count ;;
  }

  dimension_group: created_timestamp {
    type: time
    description: "Timestamp of when the repository was created on the host."
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

  dimension: default_branch {
    type: string
    description: "Primary branch of the repository."
    sql: ${TABLE}.default_branch ;;
  }

  dimension: description {
    type: string
    description: "Description of repository."
    sql: ${TABLE}.description ;;
  }

  dimension: display_name {
    type: string
    description: "Display name for the repository, only available for GitLab repositories."
    sql: ${TABLE}.display_name ;;
  }

  dimension: fork {
    type: yesno
    description: "Is the repository a fork of another."
    sql: ${TABLE}.fork ;;
  }

  dimension: fork_source_name_with_owner {
    type: string
    description: "If the repository is a fork, the repository name and owner seperated by a slash of the repository if was forked from."
    sql: ${TABLE}.fork_source_name_with_owner ;;
  }

  dimension: forks_count {
    type: number
    description: "Number of forks of this repository."
    sql: ${TABLE}.forks_count ;;
  }

  dimension: homepage_url {
    type: string
    description: "URL of a declared homepage or other website for the repository."
    sql: ${TABLE}.homepage_url ;;
  }

  dimension: host_type {
    type: string
    description: "Which website the repository is hosted on, either GitHub, GitLab or Bitbucket."
    sql: ${TABLE}.host_type ;;
  }

  dimension: issues_enabled {
    type: yesno
    description: "Is the bug tracker enabled for this repository?."
    sql: ${TABLE}.issues_enabled ;;
  }

  dimension: keywords {
    type: string
    description: "Comma separated array of keywords, called \"topics\" on GitHub, only available for GitHub and GitLab."
    sql: ${TABLE}.keywords ;;
  }

  dimension: language {
    type: string
    description: "Primary programming language the project is written in, only available for GitHub and Bitbucket."
    sql: ${TABLE}.language ;;
  }

  dimension_group: last_pushed_timestamp {
    type: time
    description: "Timestamp of when the repository was last pushed to, only available for GitHub repositories."
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.last_pushed_timestamp ;;
  }

  dimension_group: last_synced_timestamp {
    type: time
    description: "Timestamp of when Libraries.io last synced the repository from the host API."
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

  dimension: license {
    type: string
    description: "SPDX identifier of the license of the repository, only available for GitHub repositories."
    sql: ${TABLE}.license ;;
  }

  dimension: license_filename {
    type: string
    description: "If a license file has been detected, the full name of the license file, e.g LICENSE."
    sql: ${TABLE}.license_filename ;;
  }

  dimension: logo_url {
    type: string
    description: "Custom logo url for repository, only available for GitLab repositories."
    sql: ${TABLE}.logo_url ;;
  }

  dimension: mirror_url {
    type: string
    description: "URL of the repositroy of which this is a mirror of, only present if this repository is a mirror of another."
    sql: ${TABLE}.mirror_url ;;
  }

  dimension: name_with_owner {
    type: string
    description: "The repository name and owner seperated by a slash, also maps to the url slug on the given repository host e.g. librariesio/libraries.io."
    sql: ${TABLE}.name_with_owner ;;
  }

  dimension: open_issues_count {
    type: number
    description: "Number of open issues on the repository bug tracker, only available for GitHub and GitLab."
    sql: ${TABLE}.open_issues_count ;;
  }

  dimension: pages_enabled {
    type: yesno
    description: "Is GitHub pages enabled for this repository? only possible for GitHub."
    sql: ${TABLE}.pages_enabled ;;
  }

  dimension: pull_requests_enabled {
    type: string
    description: "Are pull requests enabled for this repository? Only available for GitLab repositories."
    sql: ${TABLE}.pull_requests_enabled ;;
  }

  dimension: readme_filename {
    type: string
    description: "If a readme file has been detected, the full name of the readme file, e.g README.md."
    sql: ${TABLE}.readme_filename ;;
  }

  dimension: scm_type {
    type: string
    description: "Type of source control repository uses, always \"git\" for GitHub and GitLab."
    sql: ${TABLE}.scm_type ;;
  }

  dimension: security_audit_filename {
    type: string
    description: "If a Security Audit file has been detected, the full name of the Security Audit file, e.g security.md."
    sql: ${TABLE}.security_audit_filename ;;
  }

  dimension: security_threat_model_filename {
    type: string
    description: "If a Security Threat Model file has been detected, the full name of the Security Threat Model file, e.g threatmodel.md."
    sql: ${TABLE}.security_threat_model_filename ;;
  }

  dimension: size {
    type: number
    description: "Size of the repository in kilobytes, only available for GitHub and Bitbucket."
    sql: ${TABLE}.size ;;
  }

  dimension: sourcerank {
    type: number
    description: "Libraries.io defined score based on quality, popularity and community metrics."
    sql: ${TABLE}.sourcerank ;;
  }

  dimension: stars_count {
    type: number
    description: "Number of stars on the repository, only available for GitHub and GitLab."
    sql: ${TABLE}.stars_count ;;
  }

  dimension: status {
    type: string
    description: "Either Active, Deprecated, Unmaintained, Help Wanted, Removed, no value also means active. Updated when detected by Libraries.io or su. manually by Libraries.io user via \"repo suggection\" feature."
    sql: ${TABLE}.status ;;
  }

  dimension_group: updated_timestamp {
    type: time
    description: "Timestamp of when the repository was last saved by Libraries.io."
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

  dimension: uuid {
    type: string
    description: "ID of the repository on the remote host, not unique between GitLab and GitHub repositories."
    sql: ${TABLE}.uuid ;;
  }

  dimension: watchers_count {
    type: number
    description: "Number of subscribers to all notifications for the repository, only available for GitHub and Bitbucket."
    sql: ${TABLE}.watchers_count ;;
  }

  dimension: wiki_enabled {
    type: yesno
    description: "Is the wiki enabled for this repository?."
    sql: ${TABLE}.wiki_enabled ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      security_threat_model_filename,
      readme_filename,
      license_filename,
      code_of_conduct_filename,
      display_name,
      contributing_guidelines_filename,
      security_audit_filename,
      changelog_filename
    ]
  }
}
