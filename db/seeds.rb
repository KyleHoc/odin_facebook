# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(name: "Guy Smith", email: "anemail@gmail.com", password: "password1")
User.create(name: "Rachel Miller", email: "thisemail@yahoo.com", password: "password2")
User.create(name: "Marty Silver", email: "temp@gmail.com", password: "password3")
