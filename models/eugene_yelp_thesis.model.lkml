connection: "lookerdata_publicdata_standard_sql"

# include all the views
include: "/views/**/*.view"

datagroup: eugene_yelp_thesis_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: eugene_yelp_thesis_default_datagroup

explore: business {
  join: business__hours {
    view_label: "Business: Hours"
    sql: LEFT JOIN UNNEST([${business.hours}]) as business__hours ;;
    relationship: one_to_one
  }

  join: business__attributes {
    view_label: "Business: Attributes"
    sql: LEFT JOIN UNNEST([${business.attributes}]) as business__attributes ;;
    relationship: one_to_one
  }
}

explore: checkin {
  join: business {
    type: left_outer
    sql_on: ${checkin.business_id} = ${business.business_id} ;;
    relationship: many_to_one
  }
}

explore: review {
  join: user {
    type: left_outer
    sql_on: ${review.user_id} = ${user.user_id} ;;
    relationship: many_to_one
  }

  join: business {
    type: left_outer
    sql_on: ${review.business_id} = ${business.business_id} ;;
    relationship: many_to_one
  }
}

explore: tip {
  join: user {
    type: left_outer
    sql_on: ${tip.user_id} = ${user.user_id} ;;
    relationship: many_to_one
  }

  join: business {
    type: left_outer
    sql_on: ${tip.business_id} = ${business.business_id} ;;
    relationship: many_to_one
  }
}

explore: user {}