class DataPoint < ApplicationRecord
  belongs_to :room
  belongs_to :node

  enum type: [:temperature, :humidity, :voc]

  validates :room, presence: true
  validates :node, presence: true
  validates :type,
            presence: true,
            inclusion: {
              in: DataPoint.types.keys
            }

  scope :temperature, -> { where(type: DataPoint.types[:temperature]) }
  scope :humidity, -> { where(type: DataPoint.types[:humidity]) }
  scope :voc, -> { where(type: DataPoint.types[:voc]) }
end
