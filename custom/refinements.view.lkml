include: "/views/**/*.view.lkml"
include: "/custom/**/*.explore"
include: "/custom/**/*.view"

view: +versions {
  # Adds additional timeframes to a previously defined dimension
  dimension_group: published_timestamp {
    timeframes: [
      time,
      time_of_day,
      month_name,
      date,
      day_of_week,
      week,
      month,
      quarter,
      year
    ]
  }
}
