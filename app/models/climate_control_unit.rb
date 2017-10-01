class ClimateControlUnit < ApplicationRecord
  belongs_to :room
  belongs_to :slot

  enum kind: [:outside, :ac, :heater, :cooler, :dehumidifier, :humidifier]

  validates :room, presence: true
  validates :kind,
            presence: true,
            inclusion: {
              in: ClimateControlUnit.kinds.keys
            }
end
