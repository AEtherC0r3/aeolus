class Node < ApplicationRecord
  belongs_to :room
  has_many :slots
  has_many :climate_control_units, through: :slots

  validates :room, presence: :true
  validates :api_key,
            presence: :true,
            uniqueness: :true
  validates :capabilities,
            presence: :true,
            inclusion: {
              in: 0..31
            }

  def decode_capabilities
    decoded_capabilities = []

    if capabilities % 2 == 1
      decoded_capabilities.append('temperature')
    end

    if capabilities >> 1 % 2 == 1
      decoded_capabilities.append('humidity')
    end

    if capabilities >> 2 % 2 == 1
      decoded_capabilities.append('ir')
    end

    if capabilities >> 3 % 2 == 1
      decoded_capabilities.append('voc')
    end

    if capabilities >> 4 % 2 == 1
      decoded_capabilities.append('control')
    end

    return decoded_capabilities
  end
end
