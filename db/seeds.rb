require 'open-uri'

Format = %w(Remote Office)
event_type = %w(Lunch Drink Coffee)

puts 'starting seed'
UserEvent.destroy_all
Event.destroy_all
User.destroy_all

puts 'previous seed destroyed'
puts 'creating new seed'

user1 = User.new(email: "abc@gmail.com", password: "123456", first_name: "Nicolas", last_name: "Ollier", address: "5 rue de Menilmontant")
user1.save!
puts 'user1 done!'

user2 = User.new(email: "def@gmail.com", password: "123456", first_name: "Fabien", last_name: "Cornen", address: "40 avenue george V")
user2.save!
puts 'user2 done!'

user3 = User.new(email: "ghi@gmail.com", password: "123456", first_name: "Stephan", last_name: "Altmuller", address: "8 rue des nanettes")
user3.save!
puts 'user3 done!'

user4 = User.new(email: "lucademeo@gmail.com", password: "123456", first_name: "Luca", last_name: "De meo", address: "8 rue des nanettes")
user4.save!
puts 'user4 done!'

event1 = Event.new(start_date: ("2022-03-04 17:30:00"), end_date: ("2022-03-04 18:00:00"),
format: Format.sample, event_type: "Coffee", canceled: false, address: "8 rue des nanettes")
event1.save!
puts 'event1 done!'

user_event1 = UserEvent.new(user: user3, event: event1, ranking_done: false)
user_event1.save!
puts 'user_event1 done!'

user_event2 = UserEvent.new(user: user4, event: event1, ranking_done: false)
user_event2.save!
puts 'user_event2 done!'

event2 = Event.new(start_date: ("2022-03-08 16:00:00"), end_date: ("2022-03-08 16:30:00"),
format: Format.sample, event_type: "Coffee", canceled: false, address: "8 rue des nanettes")
event2.save!
puts 'event2 done!'

user_event3 = UserEvent.new(user: user3, event: event2, ranking_done: false)
user_event3.save!
puts 'user_event3 done!'

user_event8 = UserEvent.new(user: user1, event: event2, ranking_done: false)
user_event8.save!
puts 'user_event8 done!'

event3 = Event.new(start_date: ("2022-03-18 13:00:00"), end_date: ("2022-03-18 14:00:00"),
format: Format.sample, event_type: "Lunch", canceled: false, address: "8 rue des nanettes")
event3.save!
puts 'event3 done!'

user_event4 = UserEvent.new(user: user3, event: event3, ranking_done: false)
user_event4.save!
puts 'user_event4 done!'

event4 = Event.new(start_date: ("2022-03-01 12:00:00"), end_date: ("2022-03-01 13:00:00"),
format: Format.sample, event_type: "Lunch", canceled: false, address: "8 rue des nanettes")
event4.save!
puts 'event4 done!'

user_event5 = UserEvent.new(user: user3, event: event4, ranking_done: false)
user_event5.save!
puts 'user_event5 done!'

event5 = Event.new(start_date: ("2022-02-15 13:00:00"), end_date: ("2022-02-15 14:00:00"),
format: Format.sample, event_type: "Lunch", canceled: false, address: "8 rue des nanettes")
event5.save!
puts 'event5 done!'

user_event6 = UserEvent.new(user: user3, event: event5, ranking_done: false)
user_event6.save!
puts 'user_event6 done!'

event6 = Event.new(start_date: ("2022-02-03 18:00:00"), end_date: ("2022-02-03 19:00:00"),
format: Format.sample, event_type: "Drink", canceled: true, address: "8 rue des nanettes")
event6.save!
puts 'event6 done!'

user_event7 = UserEvent.new(user: user3, event: event6, ranking_done: false)
user_event7.save!
puts 'user_event7 done!'

# event7 = Event.new(start_date: ("2022-03-04 12:00:00"), end_date: ("2022-03-04 14:00:00"),
# format: Format.sample, event_type: event_type.sample, canceled: false, address: "8 rue des nanettes")
# event7.save!
# puts 'event7 done!'

# event8 = Event.new(start_date: ("2022-03-04 12:00:00"), end_date: ("2022-03-04 14:00:00"),
# format: Format.sample, event_type: event_type.sample, canceled: false, address: "8 rue des nanettes")
# event8.save!
# puts 'event8 done!'

# user_event8 = UserEvent.new(user: user1, event: event8, ranking_done: false)
# user_event8.save!
# puts 'user_event8 done!'

# event9 = Event.new(start_date: ("2022-03-04 12:00:00"), end_date: ("2022-03-04 14:00:00"),
# format: Format.sample, event_type: event_type.sample, canceled: false, address: "8 rue des nanettes")
# event9.save!
# puts 'event9 done!'

# user_event9 = UserEvent.new(user: user2, event: event9, ranking_done: false)
# user_event9.save!
# puts 'user_event9 done!'

# event10 = Event.new(start_date: ("2022-03-04 12:00:00"), end_date: ("2022-03-04 14:00:00"),
# format: Format.sample, event_type: event_type.sample, canceled: false, address: "8 rue des nanettes")
# event10.save!
# puts 'event10 done!'

# user_event10 = UserEvent.new(user: user3, event: event10, ranking_done: false)
# user_event10.save!
# puts 'user_event10 done!'

puts 'seed done'
