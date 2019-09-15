view: user {
  sql_table_name: yelp_new.user ;;
  drill_fields: [user_id]

  dimension: user_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: average_stars {
    type: number
    sql: ${TABLE}.average_stars ;;
  }

  dimension: compliment_cool {
    type: number
    sql: ${TABLE}.compliment_cool ;;
  }

  dimension: compliment_cute {
    type: number
    sql: ${TABLE}.compliment_cute ;;
  }

  dimension: compliment_funny {
    type: number
    sql: ${TABLE}.compliment_funny ;;
  }

  dimension: compliment_hot {
    type: number
    sql: ${TABLE}.compliment_hot ;;
  }

  dimension: compliment_list {
    type: number
    sql: ${TABLE}.compliment_list ;;
  }

  dimension: compliment_more {
    type: number
    sql: ${TABLE}.compliment_more ;;
  }

  dimension: compliment_note {
    type: number
    sql: ${TABLE}.compliment_note ;;
  }

  dimension: compliment_photos {
    type: number
    sql: ${TABLE}.compliment_photos ;;
  }

  dimension: compliment_plain {
    type: number
    sql: ${TABLE}.compliment_plain ;;
  }

  dimension: compliment_profile {
    type: number
    sql: ${TABLE}.compliment_profile ;;
  }

  dimension: compliment_writer {
    type: number
    sql: ${TABLE}.compliment_writer ;;
  }

  dimension: cool {
    type: number
    sql: ${TABLE}.cool ;;
  }

  dimension: elite {
    type: number
    sql: ${TABLE}.elite ;;
  }

  dimension: fans {
    type: number
    sql: ${TABLE}.fans ;;
  }

  dimension: friends {
    type: string
    sql: ${TABLE}.friends ;;
  }

  dimension: funny {
    type: number
    sql: ${TABLE}.funny ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: review_count {
    type: number
    sql: ${TABLE}.review_count ;;
  }

  dimension: useful {
    type: number
    sql: ${TABLE}.useful ;;
  }

  dimension_group: yelping_since {
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
    sql: ${TABLE}.yelping_since ;;
  }

  measure: count {
    type: count
    drill_fields: [user_id, name, review.count, tip.count]
  }
}
