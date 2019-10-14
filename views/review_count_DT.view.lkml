view: review_count_DT {
  derived_table: {
    explore_source: review {
      column: business_id { field: business.business_id }
      column: state { field: business.state }
      column: count {}
      column: average_stars {}
      column: city { field: business.city }
      column: max_date {}
      column: min_date {}
      derived_column: rank {
        sql: RANK() OVER (ORDER BY count DESC) ;;
      }
      filters: {
        field: business.state
        value: "NV"
      }
      filters: {
        field: business.city
        value: "Las Vegas"
      }
      filters: {
        field: review.count
        value: ">200"
      }

      bind_filters: {
        from_field: review_count_DT.rank_category
        to_field: categories.split_categories
      }
    }
  }

  filter: rank_category {
    type: string
    suggest_explore: review
    suggest_dimension: categories.split_categories
    sql: {% condition %} ${categories.split_categories} {% endcondition %};;
#     AND ${rank} IN ({{ left_rank._parameter_value }},{{ right_rank._parameter_value }})
#          {% if left_rank._parameter_value == nil AND right_rank._parameter_value == nil %}
#          {% endif %}
  }

  dimension: business_id {
    hidden: yes
  }

  dimension: rank {
    type: number
    html: <strong><p style="color: #C70039; font-size: 250%; font-family: garamond">{{ rendered_value }}</p></strong> ;;
  }

  dimension: count {
    type: number
  }

  dimension: average_stars {
    type: number
    value_format_name: decimal_2
  }

  dimension: max_date {
    type: date
  }

  dimension: min_date {
    type: date
  }

}
