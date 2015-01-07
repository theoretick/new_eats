require 'rake'
require_relative '../oregon_city_importer'

namespace :city_importer do
  task :execute => :environment do |t, args|
    oregon_city_limits_2013_url = 'http://navigator.state.or.us/sdl/data/shapefile/k24/citylim_2013.zip'
    filepath = CityImporter::Downloader.execute(oregon_city_limits_2013_url)
    CityImporter::Importer.execute(filepath)
  end
end