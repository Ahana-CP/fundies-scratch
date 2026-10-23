use context dcic2024

import math as M
import statistics as S

#|
|#

cafe-data = 
  table: day, drinks-sold
    row: "mon", 45
    row: "tue", 30
    row: "wed", 55
    row: "thu", 40
    row: "fri", 60    
  end

sales = cafe-data.get-column("drinks-sold")
  
M.max(sales)
S.mean(sales)
S.median(sales)

discount-codes = [list: "newyear", "student", "NONE", "student", "vip", "nonw"]

unique-codes = distinct(discount-code)

fun is-real-code(code :: String) -> Boolean:
  not(string-to-lower(code) == "none")
end
real-codes = filter(is-real-code, unique-codes)
first-code = real-codes.get(0)
lower-code = map(string-to-lower, real-codes)

new-lower-code = map(string-to-lower, discount-codes)

#new-real-codes = is-real-code, new-lower-codes)
new-first-codes = new-real-code.get(0)

distinct(filter(is-real-code, map(string-to-lower, discount-codes)))

#sort list in acending order
sales.sort()
#sort in decending order
sales.sort().reverse()

var total = 1
total := total + 10
total


#|for my-sum(num-list :: List) -> Number block:
  doc: "a decent doc string"
  var new-total = 0
  for each(n from num-list):
    new-total := new-total + n
  end
  new-total
  where: 
  my-sum([list: 0, 1, 2, 3]) is 6
end
|#
fun add-two(numbers :: List<Number>) -> List<Number> block:
  var added-two = [list:]
  for each(n from number):
    added-two := added-two.append([list: n + 2])
  end
  added-two
where: add-two([list: 1, 2, 3]) is [list: 3,4,5]
end
  
map(lam(p): p + (p * 0.02) end, sales)

#fold :: (f :: (Basem Elt -> Base), base :: base, lst :: List <Elt>) -> Number

fun my-sum-fold(num-list :: List<Number>) -> Number:
  fold(lam(acc, n): acc + n end, 0, num-list)
where:
  my-sum-fold([list: 0, 1, 2, 3]) is 6
  my-sum-fold([list: ]) is 0
end