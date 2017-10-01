class DataPoint < ApplicationRecord
  belongs_to :room, dependent: :destroy
  belongs_to :node

  enum kind: [:temperature, :humidity, :voc]

  validates :room, presence: true
  validates :node, presence: true
  validates :kind,
            presence: true,
            inclusion: {
              in: DataPoint.kinds.keys
            }
  validates :value, presence: true
  validate :kind_in_node_capabilities

  private

  def kind_in_node_capabilities
    return unless node.decode_capabilities.includes kind
    errors.add(:kind, "must be in #{node.decode_capabilities}")
  end
end
