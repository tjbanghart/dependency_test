include: "/custom/**/*.view"
include: "/custom/**/*.explore"

# https://gcps228.cloud.looker.com/explore/dependency_demo/dependencies_with_repository?toggle=fil&qid=ezGui5iFUxogJE2dMV648O
view: top_n_by_language {
  extends: [parameters]
  derived_table: {
    explore_source: dependencies_with_repository {
      column: language { field: projects.language }
      column: avg_dependent_projects { field: projects.avg_dependent_projects }
      column: avg_dependent_repos { field: projects.avg_dependent_repos }
      column: sum_dependent_projects { field: projects.sum_dependent_projects }
      column: sum_dependent_repositories { field: projects.sum_dependent_repositories }
      column: count { field: projects.count }
      derived_column: rank {
        sql: RANK() OVER(ORDER BY {% parameter top_rank_measure %}  DESC) ;;
      }
      filters: {
        field: projects.language
        value: "-NULL"
      }
    }
  }
  dimension: language { hidden: yes }
  dimension: language_name {
    hidden: yes
    view_label: "@{TOP_N_CONST}"
    label: "Language (Top {% if top_rank_limit._is_filtered %}{% parameter top_rank_limit %}{% else %}N{% endif %}) by {{ dynamic_measure }}"
    type: string
    sql:
      CASE
        WHEN ${TABLE}.rank <= {% parameter top_rank_limit %} THEN ${TABLE}.language
        ELSE 'Other'
      END
    ;;
  }
  dimension: language_rank {
    hidden: yes
    view_label: "@{TOP_N_CONST}"
    label_from_parameter: top_rank_limit
    type: string
    sql:
      CASE
        WHEN ${TABLE}.rank <= {% parameter top_rank_limit %}
          THEN
            CASE
              WHEN ${TABLE}.rank < 10 THEN  CONCAT('0', CAST(${TABLE}.rank AS STRING))
              ELSE CAST(${TABLE}.rank AS STRING)
            END
        ELSE 'Other'
      END
    ;;
  }
  dimension: language_ranking {
    view_label: "@{TOP_N_CONST}"
    sql: CONCAT(${language_rank}, ' - ', ${language_name}) ;;
  }
  measure: dynamic_measure {
    type: number
    label_from_parameter: top_rank_measure
    view_label: "@{TOP_N_CONST}"
    value_format: "#,##0"
    sql:
      {% if top_rank_measure._parameter_value == 'avg_dependent_projects' %} ${projects.avg_dependent_projects}
      {% elsif top_rank_measure._parameter_value == 'avg_dependent_repos' %} ${projects.avg_dependent_repos}
      {% elsif top_rank_measure._parameter_value == 'sum_dependent_projects' %} ${projects.sum_dependent_projects}
      {% elsif top_rank_measure._parameter_value == 'sum_dependent_repositories' %} ${projects.sum_dependent_repositories}
      {% else %}  ${projects.count}
    {% endif %};;
  }

}
