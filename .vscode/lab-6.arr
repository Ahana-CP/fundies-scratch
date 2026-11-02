use context dcic2024
#Ahana Patel

#1

25 * 0.15 # 3.75
"Electric" + " " + "bike" # "Electric bike"
string-length("handlebar") #9

#2
minute-rate :: Number = 0.15

fun ride-cost(minutes :: Number, price :: Number) -> Number:
  doc: "takes the length in minutes and price per minute and gives the price of the ride in return."
  minutes * price
where:
  ride-cost(12, 0.1) is 1.2
  ride-cost(10, minute-rate) is 1.5
end

#3

fun ride-discount(minutes :: Number) -> Number:
  doc:"gives the discounted rate dependent on the length of the ride in minutes."
  if minutes < 30: 0
  else if minutes < 60: 0.1
  else: 0.2
  end
where:
  ride-discount(19) is 0
  ride-discount(30) is 0.1
  ride-discount(60) is 0.2
  ride-discount(90) is 0.2
end

#4

rides = table: rider, minutes, rate
  row: "Ella", 20, 0.15
  row: "Farid", 45, 0.10
  row: "Grace", 70, 0.10
  row: "Hugo", 10, 0.20
end

build-column(rides, "cost", lam(r ): r["minutes"] * r["rate"] end)

filter-with(rides, lam(r): r["minutes"] >= 30 end) #"Farid" and "Grace"

#5

#rides.get-column("minutes") = minutes-list

fun total-minutes-loop(lst :: List) -> Number block:
  var total = 0
  for each(n from lst):
    total := total + n
  end
where:
  total-minutes-loop([list: 45, 55]) is 100
  total-minutes-loop([list: 1, 2, 3]) is 6
  total-minutes-loop([list: ]) is 0
end

fun total-minutes-fold(lst :: List) -> Number:
  fold(lst, lam(n): 0 + n end)
where:
  total-minutes-fold([list: 1, 2, 3]) is 6
  total-minutes-fold([list: 0]) is 0
end

#6
data Ride:
  | pedal-bike(minutes :: Number)
  | e-bike(minutes :: Number, has-pass :: Boolean)
end

fun battery-fee(Ride) -> Number:
  cases:
    |e-bike(minutes :: Number, has-pass :: Boolean): has-pass is false => 0.05 * minutes
    |pedal-bike(minutes :: Number) => 0
    |e-bike(minutes :: Number, has-pass :: Boolean): has-pass is true => 0
  end
where:
  battery-fee(e-bike(10, false)) is 0.5
    battery-fee(e-bike(10, true) )is 0
      battery-fee(pedal-bike(30)) is 0
end