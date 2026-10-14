use context dcic2024
include csv
include data-source

flights = load-table:
  rownames :: Number,
  dest :: Number, 
  air_time :: Number,
  distance :: Number,
  hour :: Number,
  minute :: Number,
  time_hour :: Number,
  dep_time :: String,
  sched_dep_time :: Number,
  dep_delaye :: String,
  arr_timee :: String,
  sched_arr_timee :: String,
  arr_delaye :: Number,
  carriere :: Number,
  flighte :: Number,
  tailnume :: Number,
  o-r :: String
  source: csv-table-file("flights.csv", default-options)
  sanitize rownames using num-sanitizer
  sanitize dest using num-sanitizer
  sanitize air_time using num-sanitizer
  sanitize distance using num-sanitizer
  sanitize hour using num-sanitizer
  sanitize minute using num-sanitizer
  sanitize time_hour using num-sanitizer
  sanitize sched_dep_time using num-sanitizer
  sanitize arr_delaye using num-sanitizer
  sanitize carriere using num-sanitizer
  sanitize flighte using num-sanitizer
  sanitize tailnume using num-sanitizer
  
end


#1
#there was a mix-up in naming the rows causing distance to be named "carriere" an so on
fun is_long_flight(row :: Row) -> Boolean:
  row["carriere"] >= 1500
where:
  is_long_flight(flights.row-n(3)) is true
 
end

new_long_flight = filter-with(flights, is_long_flight)

order-by(new_long_flight, "hour", true)


#2

fun is_delayed_departure(row :: Row) -> Boolean:
  row["distance"] >= 30
where:
  is_delayed_departure(flights.row-n(0)) is false
end

fun is_morning_sched_dep(row :: Row) -> Boolean:
  row["air_time"] < 1200
where:
  is_morning_sched_dep(flights.row-n(2)) is true
end

delay_30 = filter-with(flights, lam(row): row["distance"] >= 30 end)

delay_30_500 = filter-with(delay_30, lam(row): row["carriere"] > 500 end)

order-by(delay_30_500, "distance", true)

#3
fun fix-delay(s :: String) -> String:
  
  if s >= 0 : 0
  else: s
  end

  fun transform-column(flights, fix-delay("hour"), lam(r): get-column(r ,"air_time") == 0 end)
  end

