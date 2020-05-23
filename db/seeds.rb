# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

skirmisher = Unit.create(
  name: 'Skirmisher',
  description: 'An Archer unit with high pierce armor and an attack bonus against Archers and the Spearman line. Has a minimum range and slow attack speed.',
  attack: 3,
  armor: 0
)

archer = Unit.create(
  name: 'Archer',
  description: 'Main Archer unit. Weak to skirmishers. Good against infantry.',
  attack: 3,
  armor: 0
)