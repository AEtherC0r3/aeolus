class Slot < ApplicationRecord
  belongs_to :node
  belongs_to :climate_control_unit

  validates_presence_of :node, :climate_control_unit
end
