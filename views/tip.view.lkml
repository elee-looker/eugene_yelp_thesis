view: tip {
  sql_table_name: yelp_new.tip ;;

  dimension: business_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.business_id ;;
  }

  dimension: compliment_count {
    type: number
    sql: ${TABLE}.compliment_count ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.date ;;
  }

  dimension: text {
    type: string
    sql: ${TABLE}.text ;;
  }

  dimension: user_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [user.user_id, user.name, business.name, business.business_id]
  }
}
