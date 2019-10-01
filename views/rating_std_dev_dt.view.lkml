view: rating_std_dev_dt {
  derived_table: {
    explore_source: review {
      column: average_stars {}
      column: count {}
      column: business_id {}
    }
  }
  dimension: average_stars {
    type: number
  }
  dimension: count {
    type: number
  }
  dimension: business_id {}

  measure: std_dev {
    type: number
    # this is going to be wrong
    sql: SQRT(1/(${count}-1) * sum(${average_stars} - mean(${average_stars})) ;;
  }

}
