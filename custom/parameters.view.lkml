view: parameters {
  parameter: top_rank_limit {
    view_label: "@{TOP_N_CONST}"
    type: unquoted
    default_value: "5"
    allowed_value: {
      label: "Top 5"
      value: "5"
    }
    allowed_value: {
      label: "Top 10"
      value: "10"
    }
    allowed_value: {
      label: "Top 20"
      value: "20"
    }
    allowed_value: {
      label: "Top 50"
      value: "50"
    }
  }

  parameter: top_rank_measure {
    view_label: "@{TOP_N_CONST}"
    type: unquoted
    default_value: "avg_dependent_projects"
    allowed_value: {
      label: "Average Dependent Projects"
      value: "avg_dependent_projects"
    }
    allowed_value: {
      label: "Average Dependent Repos"
      value: "avg_dependent_repos"
    }
    allowed_value: {
      label: "Sum of Dependent Projects"
      value: "sum_dependent_projects"
    }
    allowed_value: {
      label: "Sum of Dependent Repos"
      value: "sum_dependent_repositories"
    }
    allowed_value: {
      label: "Project Count"
      value: "count"
    }
  }
}
