class DataPoint < ApplicationRecord
  belongs_to :room
  belongs_to :node
end
