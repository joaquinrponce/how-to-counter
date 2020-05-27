# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

civilizations = ['Aztecs', 'Berbers', 'Britons',' Bulgarians', 'Burmese', 'Byzantines', 'Celts', 'Chinese', 'Cumans', 'Ethiopians', 'Franks', 'Goths', 'Huns', 'Incas', 'Indians', 'Italians', 'Japanese', 'Khmer', 'Koreans', 'Lithuanians', 'Magyars', 'Malay', 'Malians', 'Mayans', 'Mongols', 'Persians', 'Portuguese', 'Saracens', 'Slavs', 'Spanish', 'Tatars', 'Teutons']

civilizations.each do |civ|
  url = "https://how-to-counter.s3.us-east-2.amazonaws.com/units/civilizations/#{civ.downcase}.jpg"
  Civilization.create(name: civ, picture_url: url)
end

elite_skirmisher = Unit.create(
  name: 'Elite Skirmisher',
  description: 'An Archer unit with high pierce armor and an attack bonus against Archers and the Spearman line. Has a minimum range and slow attack speed.',
  attack: 3,
  armor: 0,
  building: 'Archery Range',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/range/Elite+Skirmisher.jpg"
)

arbalest = Unit.create(
  name: 'Arbalest',
  description: 'Main Archer unit. Weak to skirmishers. Good against infantry.',
  attack: 3,
  armor: 0,
  building: 'Archery Range',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/range/Arbalester.jpg"
)

siege_onager= Unit.create(
  name: 'Siege Onager',
  description: 'A slow-moving siege unit with a minimum range, but powerful area-of-effect attack.',
  building: 'Siege Workshop',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/workshop/Siege+Onager.jpg"
)

paladin = Unit.create(
  name: 'Paladin',
  description: 'Powerful heavy cavalry with high HP and armor. Great mobility and strength.',
  building: 'Stable',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/stable/Paladin.jpg"
)

halberdier = Unit.create(
  name: 'Halberdier',
  description: 'Cheap infantry unit specialized to fight Cavalry. Weak to most other units.',
  building: 'Barracks',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/barracks/Halberdier.jpg"
)


teutonic = Unit.create(
  name: 'Teutonic Knight',
  description: 'Teuton Unique Unit. Very slow-moving, but extremely powerful in melee combat.',
  building: 'Castle',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/castle/Teutonic+Knight.jpg"
)

paladin.direct_counters.create(counter_unit: halberdier, description: "The Halberdier possesses a strong attack bonus against cavalry, although still losing in a one-to-one fight with a Paladin.")

arbalest.direct_counters.create(counter_unit: elite_skirmisher, description: "The Elite Skimisher's high pierce armor and attack bonus against Archers makes it a great counter to Arbalesters.")

halberdier.direct_counters.create(counter_unit: arbalest, description: "The Arbalester's range and attack bonus against Halberdiers makes it the best choice to deal with Halberdiers, defeating even large masses of them.")


halberdier.tactical_counters.create(counter_unit: teutonic, description: "The Teutonic Knight's high attack and melee armor allows it to quickly deal with Halberdiers, with a single Teutonic Knight being able to wipe out many Halberdiers at once.")

siege_onager.tactical_counters.create(counter_unit: paladin, description: "The Paladin's quick movement and high attack allows them to engage and dispatch of Siege Onagers with ease.")

