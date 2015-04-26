class City < ActiveRecord::Base

  serialize :viewport

  has_many :locales
  has_many :boundaries, as: :boundable, dependent: :delete_all

  FACTORY = RGeo::Geographic.simple_mercator_factory
  self.rgeo_factory_generator = FACTORY
  set_rgeo_factory_for_column(:location, FACTORY)

  validates_uniqueness_of :name

  def self.pdx
    find_by(name: 'Portland')
  end
end