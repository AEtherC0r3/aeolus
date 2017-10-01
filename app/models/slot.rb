class Slot < ApplicationRecord
  belongs_to :node
  belongs_to :climate_control_unit

  enum kind: [:ir, :control]

  validates :node, presence: true
  validates :climate_control_unit, presence: true
  validates :kind,
            presence: true,
            inclusion: {
              in: Slot.kinds.keys
            }
  validates_inclusion_of :kind, in: node.decode_capabilities
end
