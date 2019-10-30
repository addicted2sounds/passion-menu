# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

vertical = Vertical.create! name: 'Health & Fitness'
vertical.categories.create! [
  { name: 'Booty & Abs' },
  { name: 'Full Body' }
]
vertical = Vertical.create! name: 'Business'
vertical.categories.create! [
  { name: 'Advertising' },
  { name: 'Writing' }
]
vertical = Vertical.create! name: 'Music'
vertical.categories.create! [
  { name: 'Singing' },
  { name: 'Music Fundamentals' }
]