class Target < ApplicationRecord
  belongs_to :room

  enum kind: [:temperature, :humidity]

  validates :room, presence: true
  validates :kind,
            presence: true,
            inclusion: {
              in: Target.kinds.keys
            },
            uniqueness: {
              scope: :room
            }
  validates :value, presence: true
  validates_inclusion_of :value, in: 15..35, if: :temperature?
  validates_inclusion_of :value, in: 10..90, if: :humidity?
end
