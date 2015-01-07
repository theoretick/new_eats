require 'rake'
require_relative '../oregon_city_importer'

namespace :city_importer do
  task :execute => :environment do |t, args|
    CityImporter::Downloader.execute(city_limits_url)
    CityImporter::Importer.execute
  end
end