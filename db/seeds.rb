# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# suppression des spots
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
