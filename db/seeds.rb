# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# suppression des spots user & contact
Activity.destroy_all
Contact.destroy_all
User.destroy_all
Spot.destroy_all
# création des spots
puts "Création des spots..."

spot1 = Spot.create(
  name: "Les Estagnots",
  address: "Poste de Secours des Estagnots, Avenue des Embruns, 40510 Le Penon, France",
  description: "description spot 1"
)

spot2 = Spot.create(
  name: "Les Culs Nus",
  address: "Boulevard du Front de Mer, Soorts-Hossegor, France",
  description: "description spot 2"
)

spot3 = Spot.create(
  name: "La Sud",
  address: "121 Boulevard de la Dune, 40150 Soorts-Hossegor, France",
  description: "description spot 3"
)

spot4 = Spot.create(
  name: "Plage de la Piste",
  address: "10 Allée du Romarin, 40130 Capbreton, France",
  description: "description spot 4"
)

spot5 = Spot.create(
  name: "Plage de la Petite Chambre d'Amour",
  address: "5 Place des Docteurs Gentilhe, 64600 Anglet, France",
  description: "description spot 5"
)

spot6 = Spot.create(
  name: "La Grande Plage",
  address: "Grande Plage, 1 Boulevard du Général de Gaulle, 64200 Biarritz, France",
  description: "description spot 6"
)

spot7 = Spot.create(
  name: "La Cote des Basques",
  address: "Plage de la Côte des Basques, 64200 Biarritz, France",
  description: "description spot 7"
)

spot8 = Spot.create(
  name: "Plage de l'Uhabia",
  address: "Plage de l'Uhabia, Rue de l'Uhabia, 64210 Bidart, France",
  description: "description spot 8"
)

spot9 = Spot.create(
  name: "Plage de Cenitz",
  address: "257 Chemin de Cenitz, 64210 Guéthary, France",
  description: "description spot 9"
)

spot10 = Spot.create(
  name: "Plage d'Hendaye",
  address: "31 Boulevard de la Mer, 64700 Hendaye, France",
  description: "description spot 10"
)

puts "10 spots créés"

puts "creation user"
user1 = User.create!(
  email: "michel@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  name: "Michel",
  admin: false,
  score: 0,
  photo: "",
  address: "12 rue st jacques",
  age: 56
)
user2 = User.create!(
  email: "toto@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  name: "Toto",
  admin: true,
  score: 5,
  photo: "",
  address: "5 rue de la liberté",
  age: 22
)
puts "users crées avec succes"

puts "creation contact"
contact1 = Contact.create!(
  name: "Julien",
  email: "julien@gmail.com",
  tel: "0603442620",
  user: user1
)
puts "contacts crées avec succes"

session1 = Activity.create!(
  id: 3,
  wave_height: 2,
  wind: 6,
  flag: "Yellow",
  period: 12,
  wind_direction: "SE",
  wave_direction: "E",
  min_score: 250,
  date_time_start: "Sat, 18 Jun 2022 08:28:00.000000000 UTC +00:00",
  date_time_end: "Sat, 18 Jun 2022 14:28:00.000000000 UTC +00:00",
  tips: "L'idéal pour ce spot est de surfer à marrée haute en raison de ses rochers et de la puissance des vagues.",
  photo: nil,
  spot_id: 6,
  name: "17 Juin - La Grande Plage",
  temp: 35,
  water_temp: 22
)


session2 = Activity.create!(
  id: 4,
  wave_height: 1,
  wind: 18,
  flag: "Green",
  period: 6,
  wind_direction: "E",
  wave_direction: "O",
  min_score: 250,
  date_time_start: "Sun, 19 Jun 2022 09:27:00.000000000 UTC +00:00",
  date_time_end: "Sun, 19 Jun 2022 15:22:00.000000000 UTC +00:00",
  tips: "Attention aux forts courants (bahines) qui peuvent vous entraîner au large ou vous décaler du spot très rapidement.",
  photo: nil,
  spot_id: 2,
  name: "19 Juin - Les Culs Nuls",
  temp: 24,
  water_temp: 19
)

session3 = Activity.create!(
  id: 5,
  wave_height: 1,
  wind: 11,
  flag: "Yellow",
  period: 4,
  wind_direction: "SE",
  wave_direction: "SO",
  min_score: nil,
  date_time_start: "Sat, 18 Jun 2022 08:28:00.000000000 UTC +00:00",
  date_time_end: "Sat, 18 Jun 2022 14:28:00.000000000 UTC +00:00",
  tips: "Les vagues à Anglet sont plus puissantes qu'à Biarritz, mais ce spot est tout à fait praticable pour des niveaux débutants à intermédiaires.",
  photo: nil,
  spot_id: 5,
  name: "18 Juin - Plage de la Petite Chambre d'Amour",
  temp: 37,
  water_temp: 22
)

session4 = Activity.create!(
  id: 6,
  wave_height: 1,
  wind: 9,
  flag: "Green",
  period: 10,
  wind_direction: "NO",
  wave_direction: "NO",
  min_score: 0,
  date_time_start: "Sun, 19 Jun 2022 09:25:00.000000000 UTC +00:00",
  date_time_end: "Sun, 19 Jun 2022 15:23:00.000000000 UTC +00:00",
  tips: "Spot idéal pour les débutants à la frontière de l'Espagne !",
  photo: nil,
  spot_id: 10,
  name: "19 Juin - Plage d'Hendaye",
  temp: 36,
  water_temp: 24
)

session5 = Activity.create!(
  id: 2,
  wave_height: 1,
  wind: 10,
  flag: "Green",
  period: 11,
  wind_direction: "SE",
  wave_direction: "E",
  min_score: 50,
  date_time_start: "Fri, 17 Jun 2022 06:41:00.000000000 UTC +00:00",
  date_time_end: "Fri, 17 Jun 2022 12:47:00.000000000 UTC +00:00",
  tips: "L'idéal pour ce spot est de surfer à marrée basse car il n'y a pas de plage à marrée haute ce qui peut rendre la sortie de l'eau très difficile.",
  photo: nil,
  spot_id: 7,
  name: "17 Juin - La Cote des Basques",
  temp: 28,
  water_temp: 21
)

puts "sessions créees avec succes"
