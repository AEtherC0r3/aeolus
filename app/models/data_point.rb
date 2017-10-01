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
  validates_inclusion_of :kind, in: node.decode_capabilities
end
