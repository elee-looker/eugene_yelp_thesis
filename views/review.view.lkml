view: review {
  sql_table_name: yelp_new.review ;;
  drill_fields: [review_id]

  dimension: review_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.review_id ;;
  }

  dimension: business_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.business_id ;;
  }

  dimension: cool {
    type: number
    sql: ${TABLE}.cool ;;
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

  dimension: funny {
    type: number
    sql: ${TABLE}.funny ;;
  }

  dimension: stars {
    type: number
    sql: ${TABLE}.stars ;;
  }

  dimension: text {
    type: string
    sql: ${TABLE}.text ;;
  }

  dimension: useful {
    type: number
    sql: ${TABLE}.useful ;;
  }

  dimension: user_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: average_stars {
    type: average
    sql: ${stars} ;;
    html: {{ value | round: 2 }}<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/57/FA_star.svg/15px-FA_star.svg.png"> ;;
  }

  measure: count {
    type: count
    drill_fields: [review_id, user.user_id, user.name, business.name, business.business_id]
  }

  measure: std_dev {
    type: number
    sql: SQRT(1/(${count}-1) * sum(POW(${stars} - ${review_count_DT.average_stars}, 2))) ;;
  }
}
