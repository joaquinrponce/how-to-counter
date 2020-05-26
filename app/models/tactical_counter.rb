class TacticalCounter < ApplicationRecord
  belongs_to :counter_unit, class_name: 'Unit'
  belongs_to :countered_unit, class_name: 'Unit'
end
