view: review {
  sql_table_name: yelp_new.review;;
  drill_fields: [review_id]

  filter: last_60_days {
    type: yesno
    sql: ${date_date} >= DATE_ADD(${review_count_DT.max_date}, INTERVAL -60 DAY) ;;
  }

  filter: last_2_years {
    type: yesno
    sql: ${date_date} >= DATE_ADD(${review_count_DT.max_date}, INTERVAL -2 YEAR) ;;
  }

#   dimension: check_yesno {
#     type: number
#     sql: {% if _filters['last_x_days']=="TRUE" %}0{% else %}1{% endif %} ;;
#   }

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

  dimension: adv_metrics {
    type: string
    sql: "Link to Advanced Metrics Page" ;;
    html: <a href="/dashboards/451?Food Category={{ _filters['review_count_DT.rank_category'] }}&Rank={{ _filters['review_count_DT.rank'] }}">{{ value }}</a> ;;
  }

  measure: average_stars {
    type: average
    sql: ${stars} ;;
    html: <p style="color: #247ACA; background-color:#FFFEF2; font-size: 200%; text-align:center; font-weight:bold">{{ value | round: 2 }}<img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/129/white-medium-star_2b50.png" width=40px height=40px></p> ;;
  }

  measure: max_date {
    type: date
    sql: MAX(${date_date}) ;;
  }

  measure: min_date {
    type: date
    sql: MIN(${date_date}) ;;
  }

  measure: count {
    type: count
    html:  <p style="font-size: 200%; text-align:center; font-weight:bold">{{ rendered_value }}</p> ;;
    drill_fields: [user.name, date_date, stars, text]
  }

  measure: std_dev {
    type: number
    sql: SQRT(1/(${count}-1) * sum(POW(${stars} - ${review_count_DT.average_stars}, 2))) ;;
    value_format_name: decimal_3
    html:  <p style="font-size: 200%; text-align:center; font-weight:bold">{{rendered_value}}</p> ;;
    drill_fields: [user.name, date_date, stars, text]
  }
}
