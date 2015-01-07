class Locale < ActiveRecord::Base

  belongs_to :city

  attr_accessible :name,
                  :location,
                  :opened_at

end