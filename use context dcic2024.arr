use context dcic2024
include csv
#1
fun leap-year(Year :: Number) -> Boolean:
doc:"a function the determins if a year was a leap year of not"
  if num-modulo(Year, 4) == 0 : true
  else if num-modulo(Year, 400) == 0 : true
  else if num-modulo(Year, 100) == 0 : true
  else:
  false
end

      where:
  leap-year(2024) is true
  leap-year(2000) is true
  leap-year(2025) is false
  leap-year(2001) is false
end
leap-year(2024)

#2
fun tick(second :: Number ) -> Number:
  doc: "a function that determins what the following second would be"
  if second == 0 : 1
  else if second == 59 : 0
   else if second < 0 : 404
  else if second >= 60 : 404
  else if num-is-integer(second): second + 1 
  else: 404   
end
where: 
  tick(0) is 1
  tick(-3) is 404
  tick(3) is 4
  tick(59) is 0
  tick(70) is 404
  tick(33.9) is 404
end

#3
fun rock-paper-scissors(player-1 :: String, player-2 :: String) -> String:
  doc:"a function that determins the result of a game of rock paper scissors"
  if player-1 == "rock":
    ask:
      | player-2 == "rock" then: "tie"
      | player-2 == "paper" then: "player-2 wins"
      | otherwise: "player-1 wins"
    end
  else if player-1 == "paper":
    ask:
      | player-2 == "rock" then: "player-1 wins"
      | player-2 == "paper" then: "tie"
      | otherwise: "player-2 wins"
    end
  else:
    ask:
      | player-2 == "rock" then: "player-2 wins"
      | player-2 == "paper" then: "player-1 wins"
      | otherwise: "tie"
    end
  end
    where:
  rock-paper-scissors("rock", "paper") is "player-2 wins"
  rock-paper-scissors("rock", "rock") is "tie"
  rock-paper-scissors("paper", "paper") is "tie"
  rock-paper-scissors("paper", "scissors") is "player-2 wins"
  rock-paper-scissors("scissors", "paper") is "player-1 wins"
  rock-paper-scissors("scissors", "scissors") is "tie"
  end

#4
planets = table: planet :: String, distance :: Number
  row: "Mercury",	0.39
  row: "Venus",	0.72
  row: "Earth",	1
  row: "Mars",	1.52
  row: "Jupiter",	5.2
  row: "Saturn",	9.54
  row: "Uranus",	19.2
  row: "Neptune",	30.06
end

planets.row-n(3)

#5
sv-table-file(filename :: String, options) -> Table

table: https://nulondon.instructure.com/courses/7350/files/1666718?wrap=1