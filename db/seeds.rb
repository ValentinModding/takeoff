# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# suppression des spots user & contact

puts "Rest de la BDD ..."

Participation.destroy_all
Activity.destroy_all
Contact.destroy_all
User.destroy_all
Spot.destroy_all

puts "Import des images vers Cloudinary"

cdb = URI.open("http://res.cloudinary.com/valentinmarcouxdev/image/upload/v1655392212/okzlhwxn93fkk2x5gyl2.jpg")
lgp = URI.open("http://res.cloudinary.com/valentinmarcouxdev/image/upload/v1655392323/br51n2jmmunt0ovhwj82.webp")
lcn = URI.open("http://res.cloudinary.com/valentinmarcouxdev/image/upload/v1655392388/abu8jt9q0oorvgfcoutf.jpg")
lca = URI.open("http://res.cloudinary.com/valentinmarcouxdev/image/upload/v1655392446/vt82gbtg9xog3ahso3nj.jpg")
hendaye = URI.open("http://res.cloudinary.com/valentinmarcouxdev/image/upload/v1655392556/xwqbp0oybwkp7qtmdd7a.jpg")
est = URI.open("http://res.cloudinary.com/valentinmarcouxdev/image/upload/v1655392656/lnmgnmej8z2d06csrc3a.jpg")
lasud = URI.open("http://res.cloudinary.com/valentinmarcouxdev/image/upload/v1655392706/gtmpc0qdllfiwefixrv8.jpg")
lapiste = URI.open("http://res.cloudinary.com/valentinmarcouxdev/image/upload/v1655392905/qvjynccl16vk0n2pqdb2.jpg")
cen = URI.open("http://res.cloudinary.com/valentinmarcouxdev/image/upload/v1655393124/mvgnvi5xsasqf29heoo2.jpg")
uhabia = URI.open("http://res.cloudinary.com/valentinmarcouxdev/image/upload/v1655393235/a0ju0p2goofr4bvvpd3l.jpg")

# création des spots
puts "Création des spots..."

spot1 = Spot.create!(
  name: "Les Estagnots",
  address: "Poste de Secours des Estagnots, Avenue des Embruns, 40510 Le Penon, France",
  description: "description spot 1"
)

spot2 = Spot.create!(
  name: "Les Culs Nus",
  address: "62 Av. des Tamaris, 40150 Soorts-Hossegor",
  description: "description spot 2"
)

spot3 = Spot.create!(
  name: "La Sud",
  address: "121 Boulevard de la Dune, 40150 Soorts-Hossegor, France",
  description: "description spot 3"
)

spot4 = Spot.create!(
  name: "Plage de la Piste",
  address: "10 Allée du Romarin, 40130 Capbreton, France",
  description: "description spot 4"
)

spot5 = Spot.create!(
  name: "Plage de la Chambre d'Amour",
  address: "5 Place des Docteurs Gentilhe, 64600 Anglet, France",
  description: "description spot 5"
)

spot6 = Spot.create!(
  name: "La Grande Plage",
  address: "1 Boulevard du Général de Gaulle, 64200 Biarritz, France",
  description: "description spot 6"
)

spot7 = Spot.create!(
  name: "La Cote des Basques",
  address: "Plage de la Côte des Basques, 64200 Biarritz, France",
  description: "description spot 7"
)

spot8 = Spot.create!(
  name: "Plage de l'Uhabia",
  address: "Plage de l'Uhabia, Rue de l'Uhabia, 64210 Bidart, France",
  description: "description spot 8"
)

spot9 = Spot.create!(
  name: "Plage de Cenitz",
  address: "257 Chemin de Cenitz, 64210 Guéthary, France",
  description: "description spot 9"
)

spot10 = Spot.create!(
  name: "Plage d'Hendaye",
  address: "31 Boulevard de la Mer, 64700 Hendaye, France",
  description: "description spot 10"
)

puts "10 spots créés"

puts "Creation des users ..."

user1 = User.create!(
  email: "michel@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  name: "Michel",
  admin: false,
  score: 0,
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
  address: "5 rue de la liberté",
  age: 22
)
puts "users crées avec succes"

puts "creation contact"
contact1 = Contact.create!(
  name: "Julien",
  email: "julien@gmail.com",
  tel: "603442620",
  user: user1
)
puts "contacts crées avec succes"

puts "Création des sessions ..."

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
  name: "17 Juin - La Grande Plage",
  temp: 35,
  water_temp: 22,
  spot: spot6
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
  name: "19 Juin - Les Culs Nuls",
  temp: 24,
  water_temp: 19,
  spot: spot2
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
  spot_id: 5,
  name: "18 Juin - Plage de la Chambre d'Amour",
  temp: 37,
  water_temp: 22,
  spot: spot5
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
  spot_id: 10,
  name: "19 Juin - Plage d'Hendaye",
  temp: 36,
  water_temp: 24,
  spot: spot10
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
  spot_id: 7,
  name: "17 Juin - La Cote des Basques",
  temp: 28,
  water_temp: 21,
  spot: spot7
)

puts "sessions créees avec succes"


puts "Ajout des images aux spots ..."

spot1.photo.attach(io: est, filename: 'EST.jpeg', content_type: 'image/jpeg')
spot2.photo.attach(io: lcn, filename: 'LCN.jpeg', content_type: 'image/jpeg')
spot3.photo.attach(io: lasud, filename: 'LASUD.jpeg', content_type: 'image/jpeg')
spot4.photo.attach(io: lapiste, filename: 'LAPISTE.jpeg', content_type: 'image/jpeg')
spot5.photo.attach(io: lca, filename: 'CDA.jpeg', content_type: 'image/jpeg')
spot6.photo.attach(io: lgp, filename: 'LGP.jpg', content_type: 'image/jpg')
spot7.photo.attach(io: cdb, filename: 'CDB.jpeg', content_type: 'image/jpeg')
spot8.photo.attach(io: uhabia, filename: 'UHABIA.jpeg', content_type: 'image/jpeg')
spot9.photo.attach(io: cen, filename: 'CEN.jpeg', content_type: 'image/jpeg')
spot10.photo.attach(io: hendaye, filename: 'hendaye.jpeg', content_type: 'image/jpeg')

puts "Images de spots bien importées"

puts "SEEDS OK"
