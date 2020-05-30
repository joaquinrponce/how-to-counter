# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password', role: 99)

## create civilizations

civilizations = ['Aztecs', 'Berbers', 'Britons', 'Bulgarians', 'Burmese', 'Byzantines', 'Celts', 'Chinese', 'Cumans', 'Ethiopians', 'Franks', 'Goths', 'Huns', 'Incas', 'Indians', 'Italians', 'Japanese', 'Khmer', 'Koreans', 'Lithuanians', 'Magyars', 'Malay', 'Malians', 'Mayans', 'Mongols', 'Persians', 'Portuguese', 'Saracens', 'Slavs', 'Spanish', 'Tatars', 'Teutons', 'Turks']

civilizations.each do |civ|
  url = "https://how-to-counter.s3.us-east-2.amazonaws.com/units/civilizations/#{civ.downcase}.png"
  Civilization.create(name: civ, picture_url: url)
end

civs = Civilization.all

##create upgrade trees

#archery range

skirmisher_tree = UpgradeTree.create(name: 'Skirmisher-line')
archer_tree = UpgradeTree.create(name: 'Archer-line')
cavarcher_tree = UpgradeTree.create(name: 'Cavalry Archer-line')

#barracks


militia_tree = UpgradeTree.create(name: 'Militia-line')
spearman_tree = UpgradeTree.create(name: 'Spearman-line')
eagle_tree = UpgradeTree.create(name: 'Eagle-line')


#stable

scout_tree = UpgradeTree.create(name: 'Scout-line')
knight_tree = UpgradeTree.create(name: 'Knight-line')
camel_tree = UpgradeTree.create(name: 'Camel-line')

#siege workshop

mangonel_tree = UpgradeTree.create(name: 'Mangonel-line')
ram_tree = UpgradeTree.create(name: 'Ram-line')
scorpion_tree = UpgradeTree.create(name: 'Scorpion-line')

#unique

teutonic_tree = UpgradeTree.create(name: 'Teutonic Knight')

#create every unit individually

# archery range
skirmisher = Unit.create(
  name: 'Skirmisher',
  description: 'An Archer unit with high pierce armor and an attack bonus against Archers and the Spearman line. Has a minimum range and slow attack speed.',
  building: 'Archery Range',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/range/Skirmisher.jpg",
  hp: 30,
  attack: 2,
  armor: 0,
  pierce_armor: 3,
  upgrade_tree: skirmisher_tree
)

skirmisher.civilizations = civs
skirmisher.save

elite_skirmisher = Unit.create(
  name: 'Elite Skirmisher',
  description: 'An Archer unit with high pierce armor and an attack bonus against Archers and the Spearman line. Has a minimum range and slow attack speed.',
  building: 'Archery Range',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/range/Elite+Skirmisher.jpg",
  hp: 35,
  attack: 3,
  armor: 0,
  pierce_armor: 4,
  upgrade_tree: skirmisher_tree
)


elite_skirmisher.civilizations = Civilization.where.not(:name => ['Turks'])
elite_skirmisher.save

archer = Unit.create(
  name: 'Archer',
  description: 'Main Archer unit. Weak to skirmishers. Good against infantry.',
  building: 'Archery Range',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/range/Archer.jpg",
  hp: 30,
  attack: 4,
  armor: 0,
  pierce_armor: 0,
  upgrade_tree: archer_tree
)

archer.civilizations = civs
archer.save

crossbowman = Unit.create(
  name: 'Crossbowman',
  description: 'Main Archer unit. Weak to skirmishers. Good against infantry.',
  building: 'Archery Range',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/range/Crossbowman.jpg",
  hp: 35,
  attack: 5,
  armor: 0,
  pierce_armor: 0,
  upgrade_tree: archer_tree
)

crossbowman.civilizations = Civilization.where.not(:name => ['Turks', 'Bulgarians'])
crossbowman.save


arbalester = Unit.create(
  name: 'Arbalester',
  description: 'Main Archer unit. Weak to skirmishers. Good against infantry.',
  building: 'Archery Range',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/range/Arbalester.jpg",
  hp: 40,
  attack: 6,
  armor: 0,
  pierce_armor: 0,
  upgrade_tree: archer_tree
)


arbalester.civilizations = Civilization.where(:name => ['Aztecs', 'Britons', 'Byzantines', 'Chinese', 'Ethiopians', 'Incas', 'Italians', 'Japanese', 'Khmer', 'Koreans', 'Magyars', 'Malay', 'Malians', 'Mayans', 'Mongols', 'Portuguese', 'Saracens', 'Vietnamese', 'Vikings'])
arbalester.save

cavalry_archer = Unit.create(
  name: 'Cavalry Archer',
  description: 'A mounted Archer Unit. Great mobility, but has a slow charge-up time when attacking.',
  building: 'Archery Range',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/range/Cavalry+Archer.jpg",
  hp: 50,
  attack: 3,
  armor: 0,
  pierce_armor: 0,
  upgrade_tree: cavarcher_tree
)

cavalry_archer.civilizations = Civilization.where.not(:name => ['Aztecs', 'Incas', 'Mayans'])
cavalry_archer.save

heavy_cavalry_archer = Unit.create(
  name: 'Heavy Cavalry Archer',
  description: 'A mounted Archer Unit. Great mobility, but has a slow charge-up time when attacking.',
  building: 'Archery Range',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/range/Heavy+Cavalry+Archer.jpg",
  hp: 60,
  attack: 7,
  armor: 10,
  pierce_armor: 0,
  upgrade_tree: cavarcher_tree
)


heavy_cavalry_archer.civilizations = Civilization.where.not(:name => ['Aztecs', 'Incas', 'Mayans' ,'Italians', 'Malay', 'Mayans', 'Portuguese', 'Teutons', 'Vikings'])
heavy_cavalry_archer.save

hand_cannoneer = Unit.create(
  name: 'Hand Cannoneer',
  description: 'Gunpowder Archer unit. Has a heavy attack, large attack bonus against infantry.',
  building: 'Archery Range',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/range/Hand+Cannoneer.jpg",
  hp: 35,
  attack: 17,
  armor: 1,
  pierce_armor: 0,
)

hand_cannoneer.civilizations = Civilization.where(:name => ['Berbers', 'Byzantines', 'Frnaks', 'Goths', 'Indians', 'Italians', 'Japanese', 'Khmer', 'Koreans', 'Lithuanians', 'Malians', 'Persians', 'Portuguese', 'Saracens', 'Spanish', 'Tatars', 'Teutons', 'Turks'])
hand_cannoneer.save
# barracks

militia = Unit.create(
  name: 'Militia',
  description: 'Cheap and quick-to-train infantry. A very basic military unit.',
  building: 'Barracks',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/barracks/Militia.jpg",
  hp: 40,
  attack: 4,
  armor: 0,
  pierce_armor: 1,
  upgrade_tree: militia_tree
)


militia.civilizations = civs
militia.save

man_at_arms = Unit.create(
  name: 'Man-at-Arms',
  description: 'Cheap and quick-to-train infantry. A very basic military unit.',
  building: 'Barracks',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/barracks/Man-at-Arms.jpg",
  hp: 45,
  attack: 6,
  armor: 0,
  pierce_armor: 1,
  upgrade_tree: militia_tree
)


man_at_arms.civilizations = civs
man_at_arms.save

long_swordsman = Unit.create(
  name: 'Long Swordsman',
  description: 'Cheap and quick-to-train infantry. A very basic military unit.',
  building: 'Barracks',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/barracks/Long+Swordsman.jpg",
  hp: 40,
  attack: 9,
  armor: 0,
  pierce_armor: 1,
  upgrade_tree: militia_tree
)


long_swordsman.civilizations = civs
long_swordsman.save

twohand_swordsman = Unit.create(
  name: 'Two-Handed Swordsman',
  description: 'Cheap and quick-to-train infantry. A very basic military unit.',
  building: 'Barracks',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/barracks/Two-Handed+Swordsman.jpg",
  hp: 40,
  attack: 11,
  armor: 0,
  pierce_armor: 1,
  upgrade_tree: militia_tree
)

twohand_swordsman.civilizations = Civilization.where.not(:name => ['Persians'])
twohand_swordsman.save

champion =  Unit.create(
  name: 'Champion',
  description: 'Cheap and quick-to-train infantry. A very basic military unit.',
  building: 'Barracks',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/barracks/Champion.jpg",
  hp: 40,
  attack: 13,
  armor: 1,
  pierce_armor: 1,
  upgrade_tree: militia_tree
)

champion.civilizations = Civilization.where.not(:name => ['Bulgairans', 'Ethiopians', 'Huns', 'Khmer', 'Malay', 'Mayans', 'Persians', 'Tatars'])
champion.save

spearman = Unit.create(
  name: 'Spearman',
  description: 'Cheap infantry unit specialized to fight Cavalry. Weak to most other units.',
  building: 'Barracks',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/barracks/Spearman.jpg",
  hp: 45,
  attack: 3,
  armor: 0,
  pierce_armor: 0,
  upgrade_tree: spearman_tree
)

spearman.civilizations = civs
spearman.save

pikeman = Unit.create(
  name: 'Pikeman',
  description: 'Cheap infantry unit specialized to fight Cavalry. Weak to most other units.',
  building: 'Barracks',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/barracks/Pikeman.jpg",
  hp: 55,
  attack: 4,
  armor: 0,
  pierce_armor: 0,
  upgrade_tree: spearman_tree
)

pikeman.civilizations = Civilization.where.not(:name => ['Turks'])
pikeman.save

halberdier = Unit.create(
  name: 'Halberdier',
  description: 'Cheap infantry unit specialized to fight Cavalry. Weak to most other units.',
  building: 'Barracks',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/barracks/Halberdier.jpg",
  hp: 60,
  attack: 6,
  armor: 0,
  pierce_armor: 0,
  upgrade_tree: spearman_tree
)


halberdier.civilizations = Civilization.where.not(:name => ['Aztecs', 'Berbers', 'Italians', 'Malians', 'Mongols', 'Saracens', 'Turks', 'Vikings'])
halberdier.save

eagle_scout = Unit.create(
  name: 'Eagle Scout',
  description: 'Infantry unit unique to the Aztecs, Incas and Mayans. Cheap to create, with a fast movement speed and high pierce armor.',
  building: 'Barracks',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/barracks/Eagle+Scout.jpg",
  hp: 50,
  attack: 4,
  armor: 0,
  pierce_armor: 2,
  upgrade_tree: eagle_tree
)


eagle_scout.civilizations = Civilization.where(:name => ['Aztecs', 'Incas', 'Mayans'])
eagle_scout.save

eagle_warrior = Unit.create(
  name: 'Eagle warrior',
  description: 'Infantry unit unique to the Aztecs, Incas and Mayans. Cheap to create, with a fast movement speed and high pierce armor.',
  building: 'Barracks',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/barracks/Eagle+Warrior.jpg",
  hp: 50,
  attack: 7,
  armor: 0,
  pierce_armor: 2,
  upgrade_tree: eagle_tree
)


eagle_warrior.civilizations = Civilization.where(:name => ['Aztecs', 'Incas', 'Mayans'])
eagle_warrior.save

elite_eagle_warrior = Unit.create(
  name: 'Elite Eagle warrior',
  description: 'Infantry unit unique to the Aztecs, Incas and Mayans. Cheap to create, with a fast movement speed and high pierce armor.',
  building: 'Barracks',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/barracks/Elite+Eagle+Warrior.jpg",
  hp: 60,
  attack: 9,
  armor: 0,
  pierce_armor: 4,
  upgrade_tree: eagle_tree
)


elite_eagle_warrior.civilizations = Civilization.where(:name => ['Aztecs', 'Incas', 'Mayans'])
elite_eagle_warrior.save

#stable 

scout_cavalry = Unit.create(
  name: 'Scout',
  description: 'Basic Cavalry unit with high movement speed but weak stats. The Scout Cavalry receives an extra +2 attack and +2 Line of Sight upon advancing to the Feudal Age.',
  building: 'Stable',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/stable/Scout+Cavalry.jpg",
  hp: 45,
  attack: 3,
  armor: 0,
  pierce_armor: 2,
  upgrade_tree: scout_tree
)


scout_cavalry.civilizations = Civilization.where(:name => ['Aztecs', 'Incas', 'Mayans'])
scout_cavalry.save


light_cavalry = Unit.create(
  name: 'Light Cavalry',
  description: 'Basic Cavalry unit with high movement speed but weak stats.',
  building: 'Stable',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/stable/Light+Cavalry.jpg",
  hp: 60,
  attack: 5,
  armor: 0,
  pierce_armor: 2,
  upgrade_tree: scout_tree
)


light_cavalry.civilizations = Civilization.where.not(:name => ['Aztecs', 'Mayans', 'Incas', 'Teutons'])
light_cavalry.save


hussar = Unit.create(
  name: 'Hussar',
  description: 'Basic Cavalry unit with high movement speed but weak stats.',
  building: 'Stable',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/stable/Hussar.jpg",
  hp: 75,
  attack: 7,
  armor: 0,
  pierce_armor: 2,
  upgrade_tree: scout_tree
)


hussar.civilizations = Civilization.where.not(:name => ['Aztecs', 'Mayans', 'Incas', 'Teutons' 'Chinese', 'Britons', 'Franks', 'Japanese', 'Malay', 'Malians', 'Portuguese', 'Vikings', 'Vietnamese'])
hussar.save

knight = Unit.create(
  name: 'Knight',
  description: 'Powerful heavy cavalry with high HP and armor. Great mobility and strength.',
  building: 'Stable',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/stable/Knight.jpg",
  hp: 100,
  attack: 10,
  armor: 2,
  pierce_armor: 2,
  upgrade_tree: knight_tree
)

knight.civilizations = Civilization.where.not(:name => ['Aztecs', 'Mayans', 'Incas', 'Indians'])
knight.save

cavalier = Unit.create(
  name: 'Cavalier',
  description: 'Powerful heavy cavalry with high HP and armor. Great mobility and strength.',
  building: 'Stable',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/stable/Cavalier.jpg",
  hp: 120,
  attack: 12,
  armor: 2,
  pierce_armor: 2,
  upgrade_tree: knight_tree
)


cavalier.civilizations = Civilization.where.not(:name => ['Aztecs', 'Incas', 'Indians', 'Mayans', 'Saracens'])
cavalier.save

paladin = Unit.create(
  name: 'Paladin',
  description: 'Powerful heavy cavalry with high HP and armor. Great mobility and strength.',
  building: 'Stable',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/stable/Paladin.jpg",
  hp: 160,
  attack: 14,
  armor: 2,
  pierce_armor: 3,
  upgrade_tree: knight_tree
)

paladin.civilizations = Civilization.where(:name => ['Byzantines', 'Celts', 'Cumans', 'Franks', 'Huns', 'Lithuanians', 'Magyars', 'Persians', 'Spanish', 'Teutons'])
paladin.save

camel = Unit.create(
  name: 'Camel Rider',
  description: 'A Heavy Cavalry unit specialized to fight Cavalry. Generally weaker than a Knight in other situations.',
  building: 'Stable',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/stable/Camel+Rider.jpg",
  hp: 100,
  attack: 5,
  armor: 0,
  pierce_armor: 0,
  upgrade_tree: camel_tree
)

camel.civilizations = Civilization.where(:name => ['Berbers', 'Byzantines', 'Chinese', 'Cumans', 'Ethiopians', 'Indians', 'Malians', 'Mongols', 'Persians', 'Saracens', 'Tatars', 'Turks'])
camel.save


heavy_camel = Unit.create(
  name: 'Heavy Camel Rider',
  description: 'A Heavy Cavalry unit specialized to fight Cavalry. Generally weaker than a Knight in other situations.',
  building: 'Stable',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/stable/Heavy+Camel+Rider.jpg",
  hp: 120,
  attack: 7,
  armor: 0,
  pierce_armor: 0,
  upgrade_tree: camel_tree
)


heavy_camel.civilizations = Civilization.where(:name => ['Berbers', 'Byzantines', 'Chinese', 'Ethiopians', 'Indians', 'Malians', 'Mongols', 'Persians', 'Saracens', 'Tatars', 'Turks'])
heavy_camel.save

#siege workshop

battering_ram = Unit.create(
  name: 'Battering Ram',
  description: 'A slow-moving siege unit with a powerful attack bonus against buildings. Can garrison military units inside. Takes extra melee damage, but also has extremely high pierce armor.',
  building: 'Siege Workshop',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/workshop/Battering+Ram.jpg",
  hp: 175,
  attack: 2,
  armor: 0,
  pierce_armor: 180,
  upgrade_tree: ram_tree
)

battering_ram.civilizations = civs
battering_ram.save

capped_ram = Unit.create(
  name: 'Capped Ram',
  description: 'A slow-moving siege unit with a powerful attack bonus against buildings. Can garrison military units inside. Takes extra melee damage, but also has extremely high pierce armor.',
  building: 'Siege Workshop',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/workshop/Capped+Ram.jpg",
  hp: 200,
  attack: 3,
  armor: 0,
  pierce_armor: 190,
  upgrade_tree: ram_tree
)


capped_ram.civilizations = civs
capped_ram.save

siege_ram = Unit.create(
  name: 'Siege Ram',
  description: 'A slow-moving siege unit with a powerful attack bonus against buildings. Can garrison military units inside. Takes extra melee damage, but also has extremely high pierce armor.',
  building: 'Siege Workshop',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/workshop/Siege+Ram.jpg",
  hp: 270,
  attack: 4,
  armor: 0,
  pierce_armor: 195,
  upgrade_tree: ram_tree
)

siege_ram.civilizations = Civilization.where.not(:name => ['Berbers', 'Britons', 'Burmese', 'Franks', 'Goths', 'Indians', 'Italians', 'Japanese', 'Koreans', 'Lithuanians', 'Magyars', 'Malay', 'Malians', 'Portuguese', 'Teutons', 'Vietnamese'])

mangonel = Unit.create(
  name: 'Mangonel',
  description: 'A slow-moving siege unit with a minimum range, but powerful area-of-effect attack.',
  building: 'Siege Workshop',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/workshop/Mangonel.jpg",
  hp: 50,
  attack: 40,
  armor: 0,
  pierce_armor: 6,
  upgrade_tree: mangonel_tree
)

mangonel.civilizations = civs
mangonel.save

onager = Unit.create(
  name: 'Onager',
  description: 'A slow-moving siege unit with a minimum range, but powerful area-of-effect attack.',
  building: 'Siege Workshop',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/workshop/Onager.jpg",
  hp: 60,
  attack: 50,
  armor: 0,
  pierce_armor: 7,
  upgrade_tree: mangonel_tree
)

onager.civilizations = Civilization.where.not(:name => ['Huns', 'Turks'])
onager.save

siege_onager = Unit.create(
  name: 'Siege Onager',
  description: 'A slow-moving siege unit with a minimum range, but powerful area-of-effect attack.',
  building: 'Siege Workshop',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/workshop/Siege+Onager.jpg",
  hp: 70,
  attack: 75,
  armor: 0,
  pierce_armor: 8,
  upgrade_tree: mangonel_tree
)

siege_onager.civilizations = Civilization.where(:name => ['Aztecs', 'Bulgarians', 'Celts', 'Cumans', 'Ethiopians', 'Koreans', 'Malians', 'Mongols', 'Sarcens', 'Slavs', 'Teutons'])
siege_onager.save


scorpion = Unit.create(
  name: 'Scorpion',
  description: 'A slow-moving siege unit with a minimum range. Launches a projectile that damages any units it passes through. Good against grouped enemies.',
  building: 'Siege Workshop',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/workshop/Scorpion.jpg",
  hp: 40,
  attack: 12,
  armor: 0,
  pierce_armor: 6,
  upgrade_tree: scorpion_tree
)

scorpion.civilizations = civs
scorpion.save

heavy_scorpion = Unit.create(
  name: 'Heavy Scorrpion',
  description: 'A slow-moving siege unit with a minimum range. Launches a projectile that damages any units it passes through. Good against grouped enemies.',
  building: 'Siege Workshop',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/workshop/Heavy+Scorpion.jpg",
  hp: 50,
  attack: 16,
  armor: 0,
  pierce_armor: 7,
  upgrade_tree: scorpion_tree
)

heavy_scorpion.civilizations = Civilization.where.not(:name => ['Aztecs', 'Byzantines', 'Cumans', 'Huns', 'Indians', 'Italians', 'Koreans', 'Lithuanians', 'Malians', 'Portuguese', 'Saracens', 'Spanish', 'Vietnamese'])
heavy_scorpion.save

bombard_cannon =  Unit.create(
  name: 'Bombard Cannon',
  description: 'A slow-moving siege unit with a long-distance attack. Excellent against buildings. Slightly weaker than the Trebuchet, but much more mobile, and more effective against military units.',
  building: 'Siege Workshop',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/workshop/Bombard+Cannon.jpg",
  hp: 80,
  attack: 40,
  armor: 2,
  pierce_armor: 5,
)

bombard_cannon.civilizations = Civilization.where(:name => ['Berbers', 'Burmese', 'Byzantines', 'Ethiopians', 'Franks', 'Goths', 'Indians', 'Italians', 'Koreans', 'Lithuanians', 'Malay', 'Malians', 'Persians', 'Portuguese', 'Saracens', 'Spanish', 'Teutons', 'Turks', 'Vietnamese'])
bombard_cannon.save

#unique

teutonic = Unit.create(
  name: 'Teutonic Knight',
  description: 'Teuton Unique Unit. Very slow-moving, but extremely powerful in melee combat.',
  building: 'Castle',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/castle/Teutonic+Knight.jpg",
  hp: 70,
  attack: 12,
  armor: 5,
  pierce_armor: 2,
  upgrade_tree: teutonic_tree
)

elite_teutonic = Unit.create(
  name: 'Elite Teutonic Knight',
  description: 'Teuton Unique Unit. Very slow-moving, but extremely powerful in melee combat.',
  building: 'Castle',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/castle/Teutonic+Knight.jpg",
  hp: 100,
  attack: 17,
  armor: 10,
  pierce_armor: 2,
  upgrade_tree: teutonic_tree
)


teutonic.civilizations = Civilization.where(:name => ['Teutons'])
elite_teutonic.civilizations = Civilization.where(:name => ['Teutons'])
teutonic.save
elite_teutonic.save

#monastery

monk = Unit.create(
  name: 'Monk',
  description: 'A slow-moving unit that cannot attack, but hat can convert enemy units and heal allied units.',
  building: 'Monastery',
  picture_url: "https://how-to-counter.s3.us-east-2.amazonaws.com/units/monastery/Monk.jpg"
)

monk.civilizations = civs
monk.save



## initial counters seeding so it doesn't look empty ##

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

