class ClimateControlUnit < ApplicationRecord
  belongs_to :room
  belongs_to :slot
end
