class ClimateControlUnit < ApplicationRecord
  belongs_to :room
  belongs_to :slot

  validates_presence_of :room, :slot
end
