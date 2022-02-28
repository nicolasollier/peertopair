require 'open-uri'

Format = %w(Remote Office)
event_type = %w(Lunch Drink Coffee)
status = %w(Passed Pending Current Coming)

puts 'starting seed'
Event.destroy_all

puts 'previous seed destroyed'
puts 'creating new seed'

event1 = Event.new(start_date: ("2022-02-28 12:00:00"), end_date: ("2022-02-28 14:00:00"),
format: Format.sample, event_type: event_type.sample, status: status.sample)
event1.save!
puts 'event1 done!'

event2 = Event.new(start_date: ("2022-02-28 12:00:00"), end_date: ("2022-02-28 14:00:00"),
format: Format.sample, event_type: event_type.sample, status: status.sample)
event2.save!
puts 'event2 done!'

event3 = Event.new(start_date: ("2022-02-28 12:00:00"), end_date: ("2022-02-28 14:00:00"),
format: Format.sample, event_type: event_type.sample, status: status.sample)
event3.save!
puts 'event3 done!'

event4 = Event.new(start_date: ("2022-02-28 12:00:00"), end_date: ("2022-02-28 14:00:00"),
format: Format.sample, event_type: event_type.sample, status: status.sample)
event4.save!
puts 'event4 done!'

event5 = Event.new(start_date: ("2022-02-28 12:00:00"), end_date: ("2022-02-28 14:00:00"),
format: Format.sample, event_type: event_type.sample, status: status.sample)
event5.save!
puts 'event5 done!'

event6 = Event.new(start_date: ("2022-02-28 12:00:00"), end_date: ("2022-02-28 14:00:00"),
format: Format.sample, event_type: event_type.sample, status: status.sample)
event6.save!
puts 'event6 done!'
