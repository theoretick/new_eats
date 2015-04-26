class Locale < ActiveRecord::Base

  belongs_to :city

  FACTORY = RGeo::Geographic.simple_mercator_factory
  set_rgeo_factory_for_column(:location, FACTORY)

  before_save :set_city!, if: proc { |x| x.location.present? }

  def set_city!
    boundary = Boundary.find_by(
      'ST_Intersects(boundaries.boundary, ST_GeomFromText(?, 4326))',
      location.as_text)
    self.city_id = boundary.city_id if boundary
  end
end