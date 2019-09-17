view: categories {
  derived_table: {
    sql:  SELECT bus.business_id AS business_id, categories
          FROM yelp_new.business AS bus
          LEFT JOIN UNNEST(SPLIT(bus.categories)) AS categories ;;
  }

  dimension: business_id {
    type: number
    hidden: yes
    sql: ${TABLE}.business_id ;;
  }

  dimension: categories {
    type: string
    sql: ${TABLE}.categories ;;
  }

  dimension: primary_key_concat {
    type: string
    primary_key: yes
    hidden: yes
    sql: CONCAT(CAST(${business_id} AS STRING), '-', categories);;
  }
}
