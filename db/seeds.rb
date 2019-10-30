# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

vertical = Vertical.create! name: 'Health & Fitness'
category = vertical.categories.create! name: 'Booty & Abs'
category.courses.create!  [
  { name: 'Loose the Gutt, keep the Butt', author: 'Anowa' },
  { name: 'BrittneBabe Fitness Transformation', author: 'Brittnebabe' },
]
category = vertical.categories.create!  name: 'Full Body'
category.courses.create!  [
  { name: 'BTX: Body Transformation Extreme', author: 'Barstarzz' },
  { name: 'Facebook Funnel Marketing', author: 'Russell Brunson' },
]

vertical = Vertical.create! name: 'Business'
category = vertical.categories.create! name: 'Advertising'
category.courses.create!  [
  { name: 'Build a Wild Audience', author: 'Tim Nilson' },
]
category = vertical.categories.create! name: 'Writing'
category.courses.create!  [
  { name: 'Editorial Writing Secrets', author: 'J. K. Rowling' },
  { name: 'Scientific Writing', author: 'Stephen Hawking' },
]

vertical = Vertical.create! name: 'Music'
category = vertical.categories.create! name: 'Singing'
category.courses.create!  [
  { name: 'Vocal Training 101', author: 'Linkin Park' },
  { name: 'Music Performance for Beginners', author: 'Lady Gaga' },
]
category = vertical.categories.create! name: 'Music Fundamentals'
category.courses.create!  [
  { name: 'Learn the Piano', author: 'Lang Lang' },
  { name: 'Become a guitar hero', author: 'Jimmy Page' },
]
