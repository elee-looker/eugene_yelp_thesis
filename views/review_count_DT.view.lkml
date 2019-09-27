view: review_count_DT {
  derived_table: {
    explore_source: review {
      column: business_id { field: business.business_id }
      column: state { field: business.state }
      column: count {}
      column: city { field: business.city }
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
    sql: {% condition %} ${categories.split_categories} {% endcondition %} ;;
  }

  dimension: business_id {
    hidden: yes
  }

  dimension: rank {
    type: number
  }

  dimension: count {
    type: number
  }

}
