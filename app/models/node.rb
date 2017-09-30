class Node < ApplicationRecord
  belongs_to :room
  has_many :slots
  has_many :climate_control_units, through: :slots

  validates :room, presence: :true
  validates :api_key,
            presence: :true,
            uniqueness: :true
end
