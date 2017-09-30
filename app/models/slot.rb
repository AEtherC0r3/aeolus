class Slot < ApplicationRecord
  belongs_to :node
  belongs_to :climate_control_unit
end
