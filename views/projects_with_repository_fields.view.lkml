view: projects_with_repository_fields {
  sql_table_name: `bigquery-public-data.libraries_io.projects_with_repository_fields`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    description: "The unique primary key of the project in the Libraries.io database."
    sql: ${TABLE}.id ;;
  }

  dimension: bh {
    type: string
    sql: ${TABLE}.bh ;;
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

  dimension: repository_changelog_filename {
    type: string
    description: "If a changelog file has been detected, the full name of the changelog file, e.g changelog.txt."
    sql: ${TABLE}.repository_changelog_filename ;;
  }

  dimension: repository_code_of_conduct_filename {
    type: string
    description: "If a code of conduct file has been detected, the full name of the code of conduct file, e.g code_of_conduct.md."
    sql: ${TABLE}.repository_code_of_conduct_filename ;;
  }

  dimension: repository_contributing_guidelines_filename {
    type: string
    description: "If a contributing guidelines file has been detected, the full name of the contributing guidelines file, e.g contributing.md."
    sql: ${TABLE}.repository_contributing_guidelines_filename ;;
  }

  dimension: repository_contributors_count {
    type: number
    description: "Number of unique contributors that have committed to the default branch."
    sql: ${TABLE}.repository_contributors_count ;;
  }

  dimension_group: repository_created_timestamp {
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
    sql: ${TABLE}.repository_created_timestamp ;;
  }

  dimension: repository_default_branch {
    type: string
    description: "Primary branch of the repository."
    sql: ${TABLE}.repository_default_branch ;;
  }

  dimension: repository_description {
    type: string
    description: "Description of repository."
    sql: ${TABLE}.repository_description ;;
  }

  dimension: repository_display_name {
    type: string
    description: "Display name for the repository, only available for GitLab repositories."
    sql: ${TABLE}.repository_display_name ;;
  }

  dimension: repository_fork {
    type: yesno
    description: "Is the repository a fork of another."
    sql: ${TABLE}.repository_fork ;;
  }

  dimension: repository_fork_source_name_with_owner {
    type: string
    description: "If the repository is a fork, the repository name and owner seperated by a slash of the repository if was forked from."
    sql: ${TABLE}.repository_fork_source_name_with_owner ;;
  }

  dimension: repository_forks_count {
    type: number
    description: "Number of forks of this repository."
    sql: ${TABLE}.repository_forks_count ;;
  }

  dimension: repository_homepage_url {
    type: string
    description: "URL of a declared homepage or other website for the repository."
    sql: ${TABLE}.repository_homepage_url ;;
  }

  dimension: repository_host_type {
    type: string
    description: "Which website the repository is hosted on, either GitHub, GitLab or Bitbucket."
    sql: ${TABLE}.repository_host_type ;;
  }

  dimension: repository_id {
    type: number
    description: "The unique primary key of the repository for this project in the Libraries.io database."
    sql: ${TABLE}.repository_id ;;
  }

  dimension: repository_issues_enabled {
    type: yesno
    description: "Is the bug tracker enabled for this repository?."
    sql: ${TABLE}.repository_issues_enabled ;;
  }

  dimension: repository_keywords {
    type: string
    description: "Comma separated array of keywords, called \"topics\" on GitHub, only available for GitHub and GitLab."
    sql: ${TABLE}.repository_keywords ;;
  }

  dimension: repository_language {
    type: string
    description: "Primary programming language the project is written in, only available for GitHub and Bitbucket."
    sql: ${TABLE}.repository_language ;;
  }

  dimension_group: repository_last_pushed_timestamp {
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
    sql: ${TABLE}.repository_last_pushed_timestamp ;;
  }

  dimension: repository_last_synced_timestamp {
    type: string
    description: "Timestamp of when Libraries.io last synced the repository from the host API."
    sql: ${TABLE}.repository_last_synced_timestamp ;;
  }

  dimension: repository_license {
    type: string
    description: "SPDX identifier of the license of the repository, only available for GitHub repositories."
    sql: ${TABLE}.repository_license ;;
  }

  dimension: repository_license_filename {
    type: string
    description: "If a license file has been detected, the full name of the license file, e.g LICENSE."
    sql: ${TABLE}.repository_license_filename ;;
  }

  dimension: repository_logo_url {
    type: string
    description: "Custom logo url for repository, only available for GitLab repositories."
    sql: ${TABLE}.repository_logo_url ;;
  }

  dimension: repository_mirror_url {
    type: string
    description: "URL of the repositroy of which this is a mirror of, only present if this repository is a mirror of another."
    sql: ${TABLE}.repository_mirror_url ;;
  }

  dimension: repository_name_with_owner {
    type: string
    description: "The repository name and owner seperated by a slash, also maps to the url slug on the given repository host e.g. librariesio/libraries.io."
    sql: ${TABLE}.repository_name_with_owner ;;
  }

  dimension: repository_open_issues_count {
    type: number
    description: "Number of open issues on the repository bug tracker, only available for GitHub and GitLab."
    sql: ${TABLE}.repository_open_issues_count ;;
  }

  dimension: repository_pages_enabled {
    type: yesno
    description: "Is GitHub pages enabled for this repository? only possible for GitHub."
    sql: ${TABLE}.repository_pages_enabled ;;
  }

  dimension: repository_pull_requests_enabled {
    type: string
    description: "Are pull requests enabled for this repository? Only available for GitLab repositories."
    sql: ${TABLE}.repository_pull_requests_enabled ;;
  }

  dimension: repository_readme_filename {
    type: string
    description: "If a readme file has been detected, the full name of the readme file, e.g README.md."
    sql: ${TABLE}.repository_readme_filename ;;
  }

  dimension: repository_scm_type {
    type: string
    description: "Type of source control repository uses, always \"git\" for GitHub and GitLab."
    sql: ${TABLE}.repository_scm_type ;;
  }

  dimension: repository_security_audit_filename {
    type: string
    description: "If a Security Audit file has been detected, the full name of the Security Audit file, e.g security.md."
    sql: ${TABLE}.repository_security_audit_filename ;;
  }

  dimension: repository_security_threat_model_filename {
    type: string
    description: "If a Security Threat Model file has been detected, the full name of the Security Threat Model file, e.g threatmodel.md."
    sql: ${TABLE}.repository_security_threat_model_filename ;;
  }

  dimension: repository_size {
    type: number
    description: "Size of the repository in kilobytes, only available for GitHub and Bitbucket."
    sql: ${TABLE}.repository_size ;;
  }

  dimension: repository_sourcerank {
    type: number
    description: "Libraries.io defined score based on quality, popularity and community metrics."
    sql: ${TABLE}.repository_sourcerank ;;
  }

  dimension: repository_stars_count {
    type: number
    description: "Number of stars on the repository, only available for GitHub and GitLab."
    sql: ${TABLE}.repository_stars_count ;;
  }

  dimension: repository_status {
    type: string
    description: "Either Active, Deprecated, Unmaintained, Help Wanted, Removed, no value also means active. Updated when detected by Libraries.io or su. manually by Libraries.io user via \"repo suggection\" feature."
    sql: ${TABLE}.repository_status ;;
  }

  dimension_group: repository_updated_timestamp {
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
    sql: ${TABLE}.repository_updated_timestamp ;;
  }

  dimension: repository_url {
    type: string
    description: "URL of source code repository declared in package manager metadata or submitted manually by Libraries.io user via \"project suggection\" feature."
    sql: ${TABLE}.repository_url ;;
  }

  dimension: repository_uuid {
    type: string
    description: "ID of the repository on the remote host, not unique between GitLab and GitHub repositories."
    sql: ${TABLE}.repository_uuid ;;
  }

  dimension: repository_watchers_count {
    type: number
    description: "Number of subscribers to all notifications for the repository, only available for GitHub and Bitbucket."
    sql: ${TABLE}.repository_watchers_count ;;
  }

  dimension: repository_wiki_enabled {
    type: yesno
    description: "Is the wiki enabled for this repository?."
    sql: ${TABLE}.repository_wiki_enabled ;;
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
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      repository_readme_filename,
      repository_code_of_conduct_filename,
      repository_security_audit_filename,
      name,
      repository_display_name,
      repository_license_filename,
      repository_contributing_guidelines_filename,
      repository_changelog_filename,
      repository_security_threat_model_filename
    ]
  }
}
