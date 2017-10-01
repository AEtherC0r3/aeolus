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
  validate :kind_in_node_capabilities

  private

  def kind_in_node_capabilities
    return if node.decode_capabilities.include? kind
    errors.add(:kind, "must be in #{node.decode_capabilities}")
  end
end
