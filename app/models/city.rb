class City < ActiveRecord::Base

  serialize :viewport

  has_many :locales

  attr_accessible :name,
                  :location,
                  :boundary,
                  :viewport

end