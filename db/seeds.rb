require 'open-uri'

Format = %w(Remote Office)
event_type = %w(Lunch Drink Coffee)

puts 'starting seed'
UserEvent.destroy_all
Event.destroy_all
User.destroy_all

puts 'previous seed destroyed'
puts 'creating new seed'

# user1 = User.new(email: "nicolas@renault.com", password: "123456", first_name: "Nicolas", last_name: "Ollier", address: "5 rue de Menilmontant", department: "IT", job_title: "Chief Technical Officer")
# photo1 = URI.open('https://media-exp1.licdn.com/dms/image/C5603AQHtPYPXOcW6_A/profile-displayphoto-shrink_800_800/0/1563874170099?e=1652313600&v=beta&t=EfQGdWFw_X7rKBEAPZIx2k62BvsSGTkNXUru8O0Viwk')
# user1.photo.attach(io: photo1, filename: "#{user1.first_name}.jpg")

# user1.save!
# puts 'user1 done!'

# user2 = User.new(email: "fabien@renault.com", password: "123456", first_name: "Fabien", last_name: "Cornen", address: "40 avenue george V", department: "Legal", job_title: "Chief Legal Officer")
# photo2 = URI.open('https://media-exp1.licdn.com/dms/image/C4D03AQG5k8_iHRknIw/profile-displayphoto-shrink_800_800/0/1600451248024?e=1652313600&v=beta&t=42u0m5UwhQ7iKNAVR3ctD7DHwcKDkDUUqq9dXbniEAA')
# user2.photo.attach(io: photo2, filename: "#{user2.first_name}.jpg")
# user2.save!
# puts 'user2 done!'

user3 = User.new(email: "stephan@renault.com", password: "123456", first_name: "Stephan", last_name: "Altmuller", address: "8 rue des nanettes", department: "Marketing", job_title: "Digital Project Manager")
photo3 = URI.open('https://media-exp1.licdn.com/dms/image/C4D03AQHyWQyqHpm6fw/profile-displayphoto-shrink_200_200/0/1618685738223?e=1648684800&v=beta&t=vDARt-87A84n0cmdqKPstcerBeGzRLCN5KZOU_qVWFY')
user3.photo.attach(io: photo3, filename: "#{user3.first_name}.jpg")
user3.save!
puts 'user3 done!'

user4 = User.new(email: "luca@renault.com", password: "123456", first_name: "Luca", last_name: "De meo", address: "8 rue des nanettes", department: "General Management", job_title: "Chief Executive Officer")
photo4 = URI.open('https://journalauto.com/wp-content/uploads/articles_img/art-34530-orig-1024x682.jpg')
user4.photo.attach(io: photo4, filename: "#{user4.first_name}.jpg")
user4.save!
puts 'user4 done!'

# user5 = User.new(email: "thierry@renault.com", password: "123456", first_name: "Thierry", last_name: "Pieton", address: "8 rue des nanettes", department: "Finance", job_title: "Chief Financial Officer")
# photo5 = URI.open('https://www.daf-mag.fr/Assets/Img/MOUVEMENT/2022/3/369932/Thierry-Pieton-promu-directeur-financier-groupe-Renault-F.jpg')
# user5.photo.attach(io: photo5, filename: "#{user5.first_name}.jpg")
# user5.save!
# puts 'user5 done!'

# user6 = User.new(email: "xavier@renault.com", password: "123456", first_name: "Xavier", last_name: "Lançon", address: "8 rue des nanettes", department: "Marketing", job_title: "Head of Digital Media")
# photo6 = URI.open('https://media-exp1.licdn.com/dms/image/C5603AQFj5obxIHqFBw/profile-displayphoto-shrink_800_800/0/1517631403544?e=1652313600&v=beta&t=Dflqj6xwQjBKvK7CYdvnyIGMdHkHhyNkxrp24Jf14kI')
# user6.photo.attach(io: photo6, filename: "#{user6.first_name}.jpg")
# user6.save!
# puts 'user6 done!'

# user7 = User.new(email: "vincent@renault.com", password: "123456", first_name: "Vincent", last_name: "Sengel", address: "8 rue des nanettes", department: "IT", job_title: "Chief Information Officer")
# photo7 = URI.open('https://media.gqmagazine.fr/photos/5f1fe7820bc2e326afb66dba/master/w_3000,h_2000,c_limit/2019-brad-pitt-ad-astra.jpg')
# user7.photo.attach(io: photo7, filename: "#{user7.first_name}.jpg")
# user7.save!
# puts 'user7 done!'

# #######Vincent start

event1 = Event.new(start_date: ("2022-03-10 13:00:00"), end_date: ("2022-03-10 14:00:00"), format: "Office", event_type: "Coffee", canceled: false)
event1.save!
puts 'event1 done!'

user_event1 = UserEvent.new(user: user3, event: event1, ranking_done: false)
user_event1.save!
puts 'user_event1 done!'

user_event2 = UserEvent.new(user: user4, event: event1, ranking_done: false)
user_event2.save!
puts 'user_event2 done!'

# event2 = Event.new(start_date: ("2022-03-11 16:00:00"), end_date: ("2022-03-11 16:30:00"), format: "Office", event_type: "Coffee", canceled: false)
# event2.save!
# puts 'event2 done!'

# user_event3 = UserEvent.new(user: user3, event: event2, ranking_done: false)
# user_event3.save!
# puts 'user_event3 done!'


# user_event8 = UserEvent.new(user: user5, event: event2, ranking_done: false)
# user_event8.save!
# puts 'user_event8 done!'

# event3 = Event.new(start_date: ("2022-03-22 13:00:00"), end_date: ("2022-03-22 14:00:00"), format: "Office", event_type: "Lunch", canceled: false)
# event3.save!
# puts 'event3 done!'

# user_event4 = UserEvent.new(user: user3, event: event3, ranking_done: false)
# user_event4.save!
# puts 'user_event4 done!'


# event4 = Event.new(start_date: ("2022-03-04 12:00:00"), end_date: ("2022-03-04 13:00:00"), format: "Office", event_type: "Lunch", canceled: false)
# event4.save!
# puts 'event4 done!'

# user_event5 = UserEvent.new(user: user3, event: event4, ranking_done: false)
# user_event5.save!
# puts 'user_event5 done!'

# event5 = Event.new(start_date: ("2022-02-15 13:00:00"), end_date: ("2022-02-15 14:00:00"), format: "Office", event_type: "Lunch", canceled: false)
# event5.save!
# puts 'event5 done!'

# user_event6 = UserEvent.new(user: user3, event: event5, ranking_done: false)
# user_event6.save!
# puts 'user_event6 done!'

# event6 = Event.new(start_date: ("2022-02-03 18:00:00"), end_date: ("2022-02-03 19:00:00"), format: "Office", event_type: "Drink", canceled: true)
# event6.save!
# puts 'event6 done!'

# user_event7 = UserEvent.new(user: user3, event: event6, ranking_done: false)
# user_event7.save!
# puts 'user_event7 done!'


###### vincent stop


# event7 = Event.new(start_date: ("2022-03-04 12:00:00"), end_date: ("2022-03-04 14:00:00"),
# format: Format.sample, event_type: event_type.sample, canceled: false)
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

# VenueRanking.create(
#   user_id: 5,
#   event_id: 7,
#   rank: 1,
#   place_name: "Renoma Café Gallery",
#   note: 1.0,
# )

# VenueRanking.create(
#   user_id: 5,
#   event_id: 7,
#   rank: 2,
#   place_name: "Le Cinq",
#   note: 0.8,
# )

# VenueRanking.create(
#   user_id: 5,
#   event_id: 7,
#   rank: 3,
#   place_name: "Hotel De Sers",
#   note: 1.0,
# )

# VenueRanking.create(
#   user_id: 5,
#   event_id: 7,
#   rank: 4,
#   place_name: "Le Paradis du Fruit",
#   note: 0.6,
# )

# VenueRanking.create(
#   user_id: 5,
#   event_id: 7,
#   rank: 5,
#   place_name: "Fouquet's Paris",
#   note: 0.2,
# )

# # n° 2

# VenueRanking.create(
#   user_id: 6,
#   event_id: 3,
#   rank: 1,
#   place_name: "Renoma Café Gallery",
#   note: 1.0,
# )

# VenueRanking.create(
#   user_id: 6,
#   event_id: 3,
#   rank: 2,
#   place_name: "Le Cinq",
#   note: 0.8,
# )

# VenueRanking.create(
#   user_id: 6,
#   event_id: 3,
#   rank: 3,
#   place_name: "Hotel De Sers",
#   note: 0.3,
# )

# VenueRanking.create(
#   user_id: 6,
#   event_id: 3,
#   rank: 4,
#   place_name: "Le Paradis du Fruit",
#   note: 0.6,
# )

# VenueRanking.create(
#   user_id: 6,
#   event_id: 3,
#   rank: 5,
#   place_name: "Fouquet's Paris",
#   note: 0.2,
# )

puts 'seed done'
