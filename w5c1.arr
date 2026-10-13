use context dcic2024
include csv
#|
   plan a task before coding it
   finding and cleaning dirty data
   visualisation
|#
#task plan is a to-do list you can check off

#|
   input = the columns you start form
   output = a compcrete example of what you want at the end
   steps = smalll enouht that each one is a single function or table operation
   tools = the operations gor each stp: filter-with, transform-column
|#
#load data table
voter-data = load-table: VoterID, DOB, Party, address, city, county, postcode
 source: csv-table-url("https://raw.githubusercontent.com/NU-London/LCSCI4207-datasets/refs/heads/main/voters.csv", default-options)
end
#ID party prob
filter-with(voter-data, lam(r): r["Party"] == "Labuor" end).length() #=> 4
voter-data.row-n(3)["Party"]

order-by(count(voter-data, "Party"), "count", false)

#reading one value with get-column

fun get-column(r :: Row, colname :: String):
  doc: "returns the vlue in row r for the column colname"
  r[colname]
where: 
  get-column(voter-data.row-n(0), "VoterID") is "1"
  get-column(voter-data.row-n(3), "Party") is "Labuor"
end
filter-with(voter-data, lam(r): get-column(r, "Party") == "Labour" end).length()
get-column(voter-data.row-n(3), "Party")

with-year = build-column(voter-data, "BirthYear", lam(r): string-substring(get-column(r, "DOB"), 6, 10)end)

get-column(with-year.row-n(0), "BirthYear")

#fixing the typo
fun fix-labour(s :: String) -> String:
  doc: "corrects the one known misspelling of labour"
  if s == "Labuor" : "Labour"
  else if s == "" : "No Party"
  else: s
  end
 where: 
    fix-labour("Labuor") is "Labour"
   fix-labour("") is "No Party"
    fix-labour("Green Party") is "Green Party"
  end

#try using transform-column

  fixed = transform-column(voter-data, "Party", fix-labour)

freq-bar-chart(fixed, "Party")