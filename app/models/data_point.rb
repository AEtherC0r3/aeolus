class DataPoint < ApplicationRecord
  belongs_to :room, dependent: :destroy
  belongs_to :node

  enum kind: [:temperature, :humidity, :voc]

  validates :room, presence: true, unless: :outside_node?
  validates :node, presence: true
  validates :kind,
            presence: true,
            inclusion: {
              in: DataPoint.kinds.keys
            }
  validates :value, presence: true
  validate :kind_in_node_capabilities

  private

  def outside_node?
    return node.outside?
  end

  def kind_in_node_capabilities
    return unless node.decode_capabilities.include? kind
    errors.add(:kind, "must be in #{node.decode_capabilities}")
  end
end
