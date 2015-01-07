require 'rgeo/shapefile'

module CityImporter
  class Downloader
    def self.execute(file_url)
    end
  end

  class Importer
    def self.execute
      puts "Done!"
    end
  end
end

def city_limits_url
  'http://navigator.state.or.us/sdl/data/shapefile/k24/citylim_2013.zip'
end
