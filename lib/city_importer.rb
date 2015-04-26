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
    def self.execute(shapefile_path, opts = default_opts)
      City.delete_all unless opts[:update_only]

      RGeo::Shapefile::Reader.open(shapefile_path) do |file|
        file.each do |record|
          attributes = record.attributes
          _city =  City.where(name: attributes["CITYNAME"]).first_or_initialize

          boundaries = record.geometry.reduce([]) do |all_boundaries, geom|
            all_boundaries << CityBoundary.new(city: _city, boundary: geom)
          end

          _city.city_boundaries = boundaries

          if _city.save
            puts "Attached City: #{_city.name} to #{_city.boundaries.size} boundaries"
          end
        end
        file.rewind
        record = file.next
      end
    end

    def self.default_opts
      {update_only: false}
    end
  end
end
