require 'rake'
require_relative '../city_importer'

namespace :city_importer do
  task :remote_import, [:url] => :environment do |t, args|
    shapes_path = CityImporter::Downloader.execute(args[:url])
    CityImporter::Importer.execute(shapes_path)
  end

  task :local_import => :environment do |t, args|
    shapes_path = Rails.root.join('lib/shapes/pdx_city_limits_poly/pdx_city_limits_poly.shp').to_s
    CityImporter::Importer.execute(shapes_path)
  end
end