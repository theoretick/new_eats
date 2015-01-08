class City < ActiveRecord::Base

  serialize :viewport

  has_many :locales
  has_many :city_boundaries

  FACTORY = RGeo::Geographic.simple_mercator_factory
  self.rgeo_factory_generator = FACTORY
  set_rgeo_factory_for_column(:location, FACTORY)

  def boundaries
    city_boundaries.map(&:boundary)
  end
end