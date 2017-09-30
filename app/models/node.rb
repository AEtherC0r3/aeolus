class Node < ApplicationRecord
  belongs_to :room
  has_many :slots
  has_many :climate_control_units, through: :slots

  validates_presence_of :room
end
