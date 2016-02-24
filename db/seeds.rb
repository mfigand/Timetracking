
1.upto(25) do |index|
  p = Project.create(
  name: "#{index}",
  description: "This is the file number #{index}"
  )

  p.entries.create(
  date: Date.today - rand(10).days,
  hours: rand(24),
  minutes: rand(60)
  )

end
#
# 1.upto(25) {|index| Entry.create hour: "#{index}", minutes:"#{index}", description: "This is the file number #{index}"}
