class Map < ApplicationRecord
  # after_validation :geocode,if: :paid_with_card?
  validates :address, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true

  private
  def geocode
    uri = URI.escape("https://maps.googleapis.com/maps/api/geocode/json?address="+self.address.gsub(" ", ""))
    res = HTTP.get(uri).to_s
    response = JSON.parse(res)
    self.latitude = response["results"][0]["geometry"]["location"]["lat"]
    self.longitude = response["results"][0]["geometry"]["location"]["lng"]
  end

  def paid_with_card?
    self.address != ""
  end

end