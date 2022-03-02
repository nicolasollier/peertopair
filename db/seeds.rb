require 'open-uri'

Format = %w(Remote Office)
event_type = %w(Lunch Drink Coffee)
status = %w(Passed Pending Current Coming)

puts 'starting seed'
User.destroy_all
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

event1 = Event.new(start_date: ("2022-02-28 12:00:00"), end_date: ("2022-02-28 14:00:00"),
format: Format.sample, event_type: "Lunch", status: "Pending")
event1.save!
puts 'event1 done!'

user_event1 = UserEvent.new(user: user1, event: event1)
user_event1.save!
puts 'user_event1 done!'

event2 = Event.new(start_date: ("2022-02-28 12:00:00"), end_date: ("2022-02-28 14:00:00"),
format: Format.sample, event_type: "Lunch", status: "Pending")
event2.save!
puts 'event2 done!'

user_event2 = UserEvent.new(user: user1, event: event2)
user_event2.save!
puts 'user_event2 done!'

event3 = Event.new(start_date: ("2022-02-28 12:00:00"), end_date: ("2022-02-28 14:00:00"),
format: Format.sample, event_type: "Lunch", status: "Pending")
event3.save!
puts 'event3 done!'

user_event3 = UserEvent.new(user: user1, event: event3)
user_event3.save!
puts 'user_event3 done!'

event4 = Event.new(start_date: ("2022-02-28 12:00:00"), end_date: ("2022-02-28 14:00:00"),
format: Format.sample, event_type: event_type.sample, status: "Pending")
event4.save!
puts 'event4 done!'

user_event4 = UserEvent.new(user: user2, event: event4)
user_event4.save!
puts 'user_event4 done!'

event5 = Event.new(start_date: ("2022-02-28 12:00:00"), end_date: ("2022-02-28 14:00:00"),
format: Format.sample, event_type: event_type.sample, status: "Pending")
event5.save!
puts 'event5 done!'

user_event5 = UserEvent.new(user: user3, event: event5)
user_event5.save!
puts 'user_event5 done!'

event6 = Event.new(start_date: ("2022-02-28 12:00:00"), end_date: ("2022-02-28 14:00:00"),
format: Format.sample, event_type: event_type.sample, status: "Pending")
event6.save!
puts 'event6 done!'

user_event6 = UserEvent.new(user: user3, event: event6)
user_event6.save!
puts 'user_event6 done!'

event7 = Event.new(start_date: ("2022-02-28 12:00:00"), end_date: ("2022-02-28 14:00:00"),
format: Format.sample, event_type: event_type.sample, status: status.sample)
event7.save!
puts 'event7 done!'

user_event7 = UserEvent.new(user: user1, event: event7)
user_event7.save!
puts 'user_event7 done!'

event8 = Event.new(start_date: ("2022-02-28 12:00:00"), end_date: ("2022-02-28 14:00:00"),
format: Format.sample, event_type: event_type.sample, status: status.sample)
event8.save!
puts 'event8 done!'

user_event8 = UserEvent.new(user: user1, event: event8)
user_event8.save!
puts 'user_event8 done!'

event9 = Event.new(start_date: ("2022-02-28 12:00:00"), end_date: ("2022-02-28 14:00:00"),
format: Format.sample, event_type: event_type.sample, status: status.sample)
event9.save!
puts 'event9 done!'

user_event9 = UserEvent.new(user: user2, event: event9)
user_event9.save!
puts 'user_event9 done!'

event10 = Event.new(start_date: ("2022-02-28 12:00:00"), end_date: ("2022-02-28 14:00:00"),
format: Format.sample, event_type: event_type.sample, status: status.sample)
event10.save!
puts 'event10 done!'

user_event10 = UserEvent.new(user: user3, event: event10)
user_event10.save!
puts 'user_event10 done!'
