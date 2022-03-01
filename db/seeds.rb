require 'open-uri'

Format = %w(Remote Office)
event_type = %w(Lunch Drink Coffee)
status = %w(Passed Pending Current Coming)

puts 'starting seed'
Event.destroy_all
User.destroy_all

puts 'previous seed destroyed'
puts 'creating new seed'

user1 = User.new(email: "abc@gmail.com", password: "123456", first_name: "Nicolas", last_name: "Ollier")
user1.save!
puts 'user1 done!'

user2 = User.new(email: "def@gmail.com", password: "123456", first_name: "Fabien", last_name: "Cornen")
user2.save!
puts 'user2 done!'

user3 = User.new(email: "ghi@gmail.com", password: "123456", first_name: "Stephan", last_name: "Altmuller")
user3.save!
puts 'user3 done!'

event1 = Event.new(start_date: ("2022-02-28 12:00:00"), end_date: ("2022-02-28 14:00:00"),
format: Format.sample, event_type: event_type.sample, status: status.sample, user_id: 1)
event1.save!
puts 'event1 done!'

event2 = Event.new(start_date: ("2022-02-28 12:00:00"), end_date: ("2022-02-28 14:00:00"),
format: Format.sample, event_type: event_type.sample, status: status.sample, user: user1)
event2.save!
puts 'event2 done!'

event3 = Event.new(start_date: ("2022-02-28 12:00:00"), end_date: ("2022-02-28 14:00:00"),
format: Format.sample, event_type: event_type.sample, status: status.sample, user: user1)
event3.save!
puts 'event3 done!'

event4 = Event.new(start_date: ("2022-02-28 12:00:00"), end_date: ("2022-02-28 14:00:00"),
format: Format.sample, event_type: event_type.sample, status: status.sample, user: user1)
event4.save!
puts 'event4 done!'

event5 = Event.new(start_date: ("2022-02-28 12:00:00"), end_date: ("2022-02-28 14:00:00"),
format: Format.sample, event_type: event_type.sample, status: status.sample, user: user1)
event5.save!
puts 'event5 done!'

event6 = Event.new(start_date: ("2022-02-28 12:00:00"), end_date: ("2022-02-28 14:00:00"),
format: Format.sample, event_type: event_type.sample, status: status.sample, user: user1)
event6.save!
puts 'event6 done!'

event7 = Event.new(start_date: ("2022-02-28 12:00:00"), end_date: ("2022-02-28 14:00:00"),
format: Format.sample, event_type: event_type.sample, status: status.sample, user: user1)
event7.save!
puts 'event7 done!'

event8 = Event.new(start_date: ("2022-02-28 12:00:00"), end_date: ("2022-02-28 14:00:00"),
format: Format.sample, event_type: event_type.sample, status: status.sample, user: user1)
event8.save!
puts 'event8 done!'

event9 = Event.new(start_date: ("2022-02-28 12:00:00"), end_date: ("2022-02-28 14:00:00"),
format: Format.sample, event_type: event_type.sample, status: status.sample, user: user1)
event9.save!
puts 'event9 done!'

event10 = Event.new(start_date: ("2022-02-28 12:00:00"), end_date: ("2022-02-28 14:00:00"),
format: Format.sample, event_type: event_type.sample, status: status.sample, user: user1)
event10.save!
puts 'event10 done!'

event11 = Event.new(start_date: ("2022-02-28 12:00:00"), end_date: ("2022-02-28 14:00:00"),
format: Format.sample, event_type: event_type.sample, status: status.sample, user: user1)
event11.save!
puts 'event11 done!'

event12 = Event.new(start_date: ("2022-02-28 12:00:00"), end_date: ("2022-02-28 14:00:00"),
format: Format.sample, event_type: event_type.sample, status: status.sample, user: user1)
event12.save!
puts 'event12 done!'



userevent1 = User_event.new()
