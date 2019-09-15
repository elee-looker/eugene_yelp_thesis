view: checkin {
  sql_table_name: yelp_new.checkin ;;

  dimension: business_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.business_id ;;
  }

  dimension: date {
    type: string
    sql: ${TABLE}.date ;;
  }

  measure: count {
    type: count
    drill_fields: [business.name, business.business_id]
  }
}
