class Locale < ActiveRecord::Base

  belongs_to :city

  FACTORY = RGeo::Geographic.simple_mercator_factory
  set_rgeo_factory_for_column(:location, FACTORY)

  before_save :set_city!, if: -> { |x| x.location.present? }

  def set_city!
    boundary = CityBoundary.find_by(
      'ST_Intersects(city_boundaries.boundary, ST_GeomFromText(?, 4326))',
      location.as_text)
    self.city_id = boundary.city_id
  end
end