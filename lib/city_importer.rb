require 'rgeo/shapefile'
require 'open-uri'

module CityImporter
  class Downloader
    def self.execute(file_url)
      local_path = Rails.root.join('tmp/city_import')
      open("#{local_path}.zip", 'wb') do |file|
        file << open(file_url).read
      end
      `mkdir -p #{local_path}`
      `tar -xzf #{local_path}.zip -C #{local_path}`
      `ls #{local_path}/*.shp`.chop
    end
  end

  class Importer
    def self.execute(shapefile_path)
      RGeo::Shapefile::Reader.open(shapefile_path) do |file|
        file.each do |record|
          _city =  City.new(name: record.attributes["CITY_NAME"])

          boundaries = record.geometry.reduce([]) do |all_boundaries, geom|
            all_boundaries << CityBoundary.new(city: _city, boundary: geom)
            all_boundaries
          end

          _city.city_boundaries = boundaries

          if _city.save
            puts "Saving City: #{_city.name} w/ #{_city.boundaries.size} boundaries"
          end
        end
        file.rewind
        record = file.next
      end
    end
  end
end
