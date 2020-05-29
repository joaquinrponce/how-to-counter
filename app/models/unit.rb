class Unit < ApplicationRecord

  has_many :direct_counters, class_name: "DirectCounter", foreign_key: "countered_unit_id"
  has_many :direct_countered, class_name: "DirectCounter", foreign_key: "counter_unit_id"
  has_many :tactical_counters, class_name: "TacticalCounter", foreign_key: "countered_unit_id"
  has_many :tactical_countered, class_name: "TacticalCounter", foreign_key: "counter_unit_id"

  has_many :direct_counter_units, through: :direct_counters, source: :counter_unit
  has_many :direct_countered_units, through: :direct_countered, source: :countered_unit
  has_many :tactical_counter_units, through: :tactical_counters, source: :counter_unit
  has_many :tactical_countered_units, through: :tactical_countered, source: :countered_unit

  has_and_belongs_to_many :civilizations

  belongs_to :upgrade_tree, optional: true
end
