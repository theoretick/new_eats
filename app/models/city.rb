class City < ActiveRecord::Base

  serialize :viewport

  has_many :locales

  FACTORY = RGeo::Geographic.spherical_factory(:srid => 4326)

  set_rgeo_factory_for_column(:location, FACTORY)
  set_rgeo_factory_for_column(:boundary, FACTORY)

  attr_accessible :name,
                  :location,
                  :boundary,
                  :viewport
end