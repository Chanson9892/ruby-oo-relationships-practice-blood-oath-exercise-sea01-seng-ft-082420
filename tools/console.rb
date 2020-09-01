require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

c1 = Cult.new("crab people", "underground", 1999, "Craaaab Peeeeople")
c2 = Cult.new("atlanteans", "underwater", 1200, "an utopia")
f1 = Follower.new("Jim", 49, "time to go off the grid")
f2 = Follower.new("Cousteau", 38, "time for a revolution")
f3 = Follower.new("agent Smith", 55, "this is not a matrix")
o1 = BloodOath.new(c1, f1)
o2 = BloodOath.new(c2, f2)
o3 = BloodOath.new(c1, f3)
o4 = BloodOath.new(c2, f1)

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits