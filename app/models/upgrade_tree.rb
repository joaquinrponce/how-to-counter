class UpgradeTree < ApplicationRecord
  has_many :units, -> { order (Arel.sql('units.id')) }
end
