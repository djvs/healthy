class Restaurant < ApplicationRecord
  has_many :reviews
  geocoded_by :street_address
  before_save :geocode

  reverse_geocoded_by :latitude, :longitude
  # after_validation :reverse_geocode  # auto-fetch address

  def street_address
    "#{addr_1}, #{addr_2}, #{addr_city}, #{addr_state} #{addr_code} #{addr_country}"
  end

end
