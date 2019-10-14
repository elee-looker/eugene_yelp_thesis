view: business {
  sql_table_name: yelp_new.business ;;
  drill_fields: [business_id]

  dimension: business_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.business_id ;;
  }

  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }

  dimension: attributes {
    hidden: yes
    sql: ${TABLE}.attributes ;;
  }

  dimension: categories {
    type: string
    sql: ${TABLE}.categories ;;
    html:
    {% assign words = {{value}} | split: ',' %}
    {% assign numwords = 0 %}
    {% for word in words %}
      {% if word == words.last %}
      {{ word }}
      {% else %}
      {{ word }},
      {% endif %}
    {% assign numwords = numwords | plus: 1 %}
    {% assign mod = numwords | modulo: 4 %}
    {% if mod == 0 %}
    <br>
    {% endif %}
    {% endfor %} ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: hours {
    hidden: yes
    sql: ${TABLE}.hours ;;
  }

  dimension: is_open {
    type: number
    sql: ${TABLE}.is_open ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: location {
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    html: <strong><p style="color: #C70039; font-size: 250%">{{ rendered_value }}</p></strong> ;;
#     drill_fields: [business.name,business.address,business.categories,business__attributes.restaurants_price_range2]
  }

  dimension: postal_code {
    type: string
    sql: ${TABLE}.postal_code ;;
  }

  dimension: review_count {
    type: number
    sql: ${TABLE}.review_count ;;
  }

  dimension: stars {
    type: number
    sql: ${TABLE}.stars ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  measure: count {
    type: count
    drill_fields: [business_id, name, review.count, checkin.count, tip.count]
  }
}

view: business__hours {
  dimension: friday {
    type: string
    sql: ${TABLE}.Friday ;;
  }

  dimension: monday {
    type: string
    sql: ${TABLE}.Monday ;;
  }

  dimension: saturday {
    type: string
    sql: ${TABLE}.Saturday ;;
  }

  dimension: sunday {
    type: string
    sql: ${TABLE}.Sunday ;;
  }

  dimension: thursday {
    type: string
    sql: ${TABLE}.Thursday ;;
  }

  dimension: tuesday {
    type: string
    sql: ${TABLE}.Tuesday ;;
  }

  dimension: wednesday {
    type: string
    sql: ${TABLE}.Wednesday ;;
  }
}

view: business__attributes {
  dimension: accepts_insurance {
    type: yesno
    sql: ${TABLE}.AcceptsInsurance ;;
  }

  dimension: ages_allowed {
    type: string
    sql: ${TABLE}.AgesAllowed ;;
  }

  dimension: alcohol {
    type: string
    sql: ${TABLE}.Alcohol ;;
  }

  dimension: ambience {
    type: string
    sql: ${TABLE}.Ambience ;;
  }

  dimension: best_nights {
    type: string
    sql: ${TABLE}.BestNights ;;
  }

  dimension: bike_parking {
    type: string
    sql: ${TABLE}.BikeParking ;;
  }

  dimension: business_accepts_bitcoin {
    type: yesno
    sql: ${TABLE}.BusinessAcceptsBitcoin ;;
  }

  dimension: business_accepts_credit_cards {
    type: string
    sql: ${TABLE}.BusinessAcceptsCreditCards ;;
  }

  dimension: business_parking {
    type: string
    sql: ${TABLE}.BusinessParking ;;
  }

  dimension: by_appointment_only {
    type: string
    sql: ${TABLE}.ByAppointmentOnly ;;
  }

  dimension: byob {
    type: yesno
    sql: ${TABLE}.BYOB ;;
  }

  dimension: byobcorkage {
    type: string
    sql: ${TABLE}.BYOBCorkage ;;
  }

  dimension: caters {
    type: yesno
    sql: ${TABLE}.Caters ;;
  }

  dimension: coat_check {
    type: yesno
    sql: ${TABLE}.CoatCheck ;;
  }

  dimension: corkage {
    type: yesno
    sql: ${TABLE}.Corkage ;;
  }

  dimension: dogs_allowed {
    type: yesno
    sql: ${TABLE}.DogsAllowed ;;
  }

  dimension: drive_thru {
    type: yesno
    sql: ${TABLE}.DriveThru ;;
  }

  dimension: good_for_dancing {
    type: yesno
    sql: ${TABLE}.GoodForDancing ;;
  }

  dimension: good_for_kids {
    type: yesno
    sql: ${TABLE}.GoodForKids ;;
  }

  dimension: good_for_meal {
    type: string
    sql: ${TABLE}.GoodForMeal ;;
  }

  dimension: hair_specializes_in {
    type: string
    sql: ${TABLE}.HairSpecializesIn ;;
  }

  dimension: happy_hour {
    type: yesno
    sql: ${TABLE}.HappyHour ;;
  }

  dimension: has_tv {
    type: yesno
    sql: ${TABLE}.HasTV ;;
  }

  dimension: music {
    type: string
    sql: ${TABLE}.Music ;;
  }

  dimension: noise_level {
    type: string
    sql: ${TABLE}.NoiseLevel ;;
  }

  dimension: outdoor_seating {
    type: yesno
    sql: ${TABLE}.OutdoorSeating ;;
  }

  dimension: restaurants_attire {
    type: string
    sql: ${TABLE}.RestaurantsAttire ;;
  }

  dimension: restaurants_delivery {
    type: yesno
    sql: ${TABLE}.RestaurantsDelivery ;;
  }

  dimension: restaurants_good_for_groups {
    type: yesno
    sql: ${TABLE}.RestaurantsGoodForGroups ;;
  }

  dimension: restaurants_price_range2 {
    type: number
    sql: ${TABLE}.RestaurantsPriceRange2 ;;
  }

  dimension: restaurants_reservations {
    type: yesno
    sql: ${TABLE}.RestaurantsReservations ;;
  }

  dimension: restaurants_table_service {
    type: yesno
    sql: ${TABLE}.RestaurantsTableService ;;
  }

  dimension: restaurants_take_out {
    type: yesno
    sql: ${TABLE}.RestaurantsTakeOut ;;
  }

  dimension: smoking {
    type: string
    sql: ${TABLE}.Smoking ;;
  }

  dimension: wheelchair_accessible {
    type: yesno
    sql: ${TABLE}.WheelchairAccessible ;;
  }

  dimension: wi_fi {
    type: string
    sql: ${TABLE}.WiFi ;;
  }
}
