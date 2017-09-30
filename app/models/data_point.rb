class DataPoint < ApplicationRecord
  belongs_to :room
  belongs_to :node

  validates_presence_of :room, :node
end
