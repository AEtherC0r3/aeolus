class Room < ApplicationRecord
  has_many :targets
  has_many :nodes
  has_many :data_points
  has_many :climate_control_units
end
