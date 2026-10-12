use context dcic2024
include csv
include data-source

flights = load-table:
  rownames :: Number,
  dest :: Number,
  air_time :: Number,
  distance :: Number,
  hour,minute :: Number,
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
  source: csv-table-url("flights.csv", default-options)
  
end
