# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Contact.destroy_all

puts "creation user"

user1 = User.create(
  email: "michel@gmail.com",
  password: "123",
  password_confirmation: "123",
  name: "Michel",
  admin: false,
  score: 0,
  photo: "",
  address: "12 rue st jacques",
  age: 56
)

user2 = User.create(
  email: "toto@gmail.com",
  password: "123",
  password_confirmation: "123",
  name: "Toto",
  admin: true,
  score: 5,
  photo: "",
  address: "5 rue de la liberté",
  age: 22
)

puts "users crées avec succes"

puts "creation contact"

contact1 = Contact.create(
  name: "Julien",
  email: "julien@gmail.com",
  tel: "0603442620",
  user_id: user1
)

puts "contacts crées avec succes"
