# If necessary, uncomment the line below to include explore_source.
# include: "eugene_yelp_thesis.model.lkml"

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
        field: categories.categories
        value: "Restaurants"
      }
      filters: {
        field: business.state
        value: "NV"
      }
      filters: {
        field: business.city
        value: "Las Vegas"
      }
    }
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
