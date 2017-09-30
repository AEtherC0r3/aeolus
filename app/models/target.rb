class Target < ApplicationRecord
  belongs_to :room

  validates_presence_of :room
end
