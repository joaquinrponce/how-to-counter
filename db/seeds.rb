# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

civilizations = ['Aztecs', 'Berbers', 'Britons', 'Bulgarians', 'Burmese', 'Byzantines', 'Celts', 'Chinese', 'Cumans', 'Ethiopians', 'Franks', 'Goths', 'Huns', 'Incas', 'Indians', 'Italians', 'Japanese', 'Khmer', 'Koreans', 'Lithuanians', 'Magyars', 'Malay', 'Malians', 'Mayans', 'Mongols', 'Persians', 'Portuguese', 'Saracens', 'Slavs', 'Spanish', 'Tatars', 'Teutons', 'Turks']

civilizations.each do |civ|
  url = "https://how-to-counter.s3.us-east-2.amazonaws.com/units/civilizations/#{civ.downcase}.png"
  Civilization.create(name: civ, picture_url: url)
end

skirmisher_tree = UpgradeTree.create(name: 'Skirmisher-line')
archer_tree = UpgradeTree.create(name: 'Archer-line')
spearman_tree = UpgradeTree.create(name: 'Spearman-line')
militia_tree = UpgradeTree.create(name: 'Militia-line')
knight_tree = UpgradeTree.create(name: 'Knight-line')

skirmisher = Unit.create(
  name: 'Skirmisher',
  description: 'An Archer unit with high pierce armor and an attack bonus against Archers and the Spearman line. Has a minimum range and slow attack speed.',
  building: 'Archery Range',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/range/Elite+Skirmisher.jpg",
  upgrade_tree: skirmisher_tree
)

elite_skirmisher = Unit.create(
  name: 'Elite Skirmisher',
  description: 'An Archer unit with high pierce armor and an attack bonus against Archers and the Spearman line. Has a minimum range and slow attack speed.',
  building: 'Archery Range',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/range/Elite+Skirmisher.jpg",
  upgrade_tree: skirmisher_tree
)

archer = Unit.create(
  name: 'Archer',
  description: 'Main Archer unit. Weak to skirmishers. Good against infantry.',
  building: 'Archery Range',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/range/Archer.jpg",
  upgrade_tree: archer_tree
)

crossbowman = Unit.create(
  name: 'Crossbowman',
  description: 'Main Archer unit. Weak to skirmishers. Good against infantry.',
  building: 'Archery Range',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/range/Crossbowman.jpg",
  upgrade_tree: archer_tree
)

arbalester = Unit.create(
  name: 'Arbalester',
  description: 'Main Archer unit. Weak to skirmishers. Good against infantry.',
  building: 'Archery Range',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/range/Arbalester.jpg",
  upgrade_tree: archer_tree
)

siege_onager= Unit.create(
  name: 'Siege Onager',
  description: 'A slow-moving siege unit with a minimum range, but powerful area-of-effect attack.',
  building: 'Siege Workshop',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/workshop/Siege+Onager.jpg"
)

knight = Unit.create(
  name: 'Knight',
  description: 'Powerful heavy cavalry with high HP and armor. Great mobility and strength.',
  building: 'Stable',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/stable/Knight.jpg",
  upgrade_tree: knight_tree
)

cavalier = Unit.create(
  name: 'Cavalier',
  description: 'Powerful heavy cavalry with high HP and armor. Great mobility and strength.',
  building: 'Stable',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/stable/Cavalier.jpg",
  upgrade_tree: knight_tree
)

paladin = Unit.create(
  name: 'Paladin',
  description: 'Powerful heavy cavalry with high HP and armor. Great mobility and strength.',
  building: 'Stable',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/stable/Paladin.jpg",
  upgrade_tree: knight_tree
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

monk = Unit.create(
  name: 'Monk',
  description: 'A slow-moving unit that cannot attack, but hat can convert enemy units and heal allied units.',
  building: 'Monastery',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/monastery/Monk.jpg"
)

paladin.direct_counters.create(counter_unit: halberdier, description: "The Halberdier possesses a strong attack bonus against cavalry, although still losing in a one-to-one fight with a Paladin.")

paladin.tactical_counters.create(counter_unit: monk, description: "Monks can easily convert enemy Paladins, which leaves the opponent with one less unit in their army, while having to fight one additional unit. Against large numbers of enemies, Monks are not as effective, and become harder to micro-manage.")

knight.direct_counters.create(counter_unit: halberdier, description: "The Halberdier possesses a strong attack bonus against cavalry, although still losing in a one-to-one fight with a Knight.")

knight.tactical_counters.create(counter_unit: monk, description: "Monks can easily convert enemy Knights, which leaves the opponent with one less unit in their army, while having to fight one additional unit. Against large numbers of enemies, Monks are not as effective, and become harder to micro-manage.")

cavalier.direct_counters.create(counter_unit: halberdier, description: "The Halberdier possesses a strong attack bonus against cavalry, although still losing in a one-to-one fight with a Cavalier.")

cavalier.tactical_counters.create(counter_unit: monk, description: "Monks can easily convert enemy Cavalier, which leaves the opponent with one less unit in their army, while having to fight one additional unit. Against large numbers of enemies, Monks are not as effective, and become harder to micro-manage.")

arbalester.direct_counters.create(counter_unit: elite_skirmisher, description: "The Elite Skirmisher's high pierce armor and attack bonus against Archers makes it a great counter to Arbalesters.")

arbalester.direct_counters.create(counter_unit: skirmisher, description: "The Skirmisher's high pierce armor and attack bonus against Archers makes it a great counter to Arbalesters.")

archer.direct_counters.create(counter_unit: elite_skirmisher, description: "The Elite Skirmisher's high pierce armor and attack bonus against Archers makes it a great counter to them.")

archer.direct_counters.create(counter_unit: skirmisher, description: "The Skirmisher's high pierce armor and attack bonus against Archers makes it a great counter tot them.")

crossbowman.direct_counters.create(counter_unit: elite_skirmisher, description: "The Elite Skirmisher's high pierce armor and attack bonus against Archers makes it a great counter to Crossbowmen.")

crossbowman.direct_counters.create(counter_unit: skirmisher, description: "The Skirmisher's high pierce armor and attack bonus against Archers makes it a great counter to Crossbowmen.")

arbalester.tactical_counters.create(counter_unit: siege_onager, description: "The Siege Onager's high damage area-of-effect attack allows it to easily destroy clumps of ranged units, although untis with higher range or good micro management can still avoid such attacks.")

archer.tactical_counters.create(counter_unit: siege_onager, description: "The Siege Onager's high damage area-of-effect attack allows it to easily destroy clumps of ranged units, although untis with higher range or good micro management can still avoid such attacks.")

crossbowman.tactical_counters.create(counter_unit: siege_onager, description: "The Siege Onager's high damage area-of-effect attack allows it to easily destroy clumps of ranged units, although untis with higher range or good micro management can still avoid such attacks.")

elite_skirmisher.tactical_counters.create(counter_unit: siege_onager, description: "The Siege Onager's high damage area-of-effect attack allows it to easily destroy clumps of ranged units, although untis with higher range or good micro management can still avoid such attacks.")

halberdier.direct_counters.create(counter_unit: arbalester, description: "The Arbalester's range and attack bonus against Halberdiers makes it the best choice to deal with Halberdiers, defeating even large masses of them.")

halberdier.direct_counters.create(counter_unit: elite_skirmisher, description: "While not as powerful as the Arbalester, the Skirmisher's attack bonus against Halberdiers makes them a very cheap and cost-efficient counter.")

halberdier.tactical_counters.create(counter_unit: teutonic, description: "The Teutonic Knight's high attack and melee armor allows it to quickly deal with Halberdiers, with a single Teutonic Knight being able to wipe out many Halberdiers at once.")

siege_onager.tactical_counters.create(counter_unit: paladin, description: "The Paladin's quick movement and high attack allows them to engage and dispatch of Siege Onagers with ease.")

teutonic.tactical_counters.create(counter_unit: arbalester, description: "The Arbalester's range and pierce damage allows them to effectively kite and kill Teutonic Knights, whose slow speed makes it difficult for them to catch up to ranged units.")

units = Unit.all
civs = Civilization.all

paladin.civilizations = Civilization.where(:name => ['Byzantines', 'Celts', 'Cumans', 'Franks', 'Huns', 'Lithuanians', 'Magyars', 'Persians', 'Spanish', 'Teutons'])
paladin.save

knight.civilizations = Civilization.where(:name => ['Byzantines', 'Celts', 'Cumans', 'Franks', 'Huns', 'Lithuanians', 'Magyars', 'Persians', 'Spanish', 'Teutons'])
knight.save

cavalier.civilizations = Civilization.where(:name => ['Byzantines', 'Celts', 'Cumans', 'Franks', 'Huns', 'Lithuanians', 'Magyars', 'Persians', 'Spanish', 'Teutons'])
cavalier.save

elite_skirmisher.civilizations = Civilization.where.not(:name => ['Turks'])
elite_skirmisher.save

arbalester.civilizations = Civilization.where(:name => ['Aztecs', 'Britons', 'Byzantines', 'Chinese', 'Ethiopians', 'Incas', 'Italians', 'Japanese', 'Khmer', 'Koreans', 'Magyars', 'Malay', 'Malians', 'Mayans', 'Mongols', 'Portuguese', 'Saracens', 'Vietnamese', 'Vikings'])
arbalester.save

crossbowman.civilizations = Civilization.where(:name => ['Aztecs', 'Britons', 'Byzantines', 'Chinese', 'Ethiopians', 'Incas', 'Italians', 'Japanese', 'Khmer', 'Koreans', 'Magyars', 'Malay', 'Malians', 'Mayans', 'Mongols', 'Portuguese', 'Saracens', 'Vietnamese', 'Vikings'])
arbalester.save

halberdier.civilizations = Civilization.where.not(:name => ['Aztecs', 'Berbers', 'Italians', 'Malians', 'Mongols', 'Saracens', 'Turks', 'Vikings'])
halberdier.save

siege_onager.civilizations = Civilization.where(:name => ['Aztecs', 'Bulgarians', 'Celts', 'Cumans', 'Ethiopians', 'Koreans', 'Malians', 'Mongols', 'Sarcens', 'Slavs', 'Teutons'])
siege_onager.save

teutonic.civilizations = Civilization.where(:name => ['Teutons'])
teutonic.save

monk.civilizations = civs
monk.save

archer.civilizations = civs
archer.save

skirmisher.civilizations = civs
skirmisher.save





