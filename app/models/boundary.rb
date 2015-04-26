class Boundary < ActiveRecord::Base

  belongs_to :boundable, :polymorphic => true

  FACTORY = RGeo::Geographic.simple_mercator_factory
  set_rgeo_factory_for_column(:boundary, FACTORY)
end