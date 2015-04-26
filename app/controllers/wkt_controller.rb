class WktController < ApplicationController

  # converts a WKT string into something consumable for leaflet.js
  #
  # GET /wkt/polygon.json?wkt_string=POLYGON ((732687.9576771855 85.0511287, 732698.0351050049 85.0511287, 732637.6322179586 85.0511287))
  #
  # returns:
  #  {
  #    points: [
  #      [
  #        85.0511287,
  #        732627.9845800549
  #      ],
  #      [
  #        85.0511287,
  #        732687.9576771855
  #      ],
  #      [
  #        85.0511287,
  #        732687.386482954
  #      ]
  #    ]
  #  }
  #
  def polygon
    render json: {
      points: build_points_from_polygon(params[:wkt_string])
    }
  end

  def pdx
    pdx = City.find_by(name: 'Portland')

    # pdx_points = pdx.city_boundaries.reduce([]) do |acc, bound|
    #   acc += build_points_from_polygon(bound.boundary.as_text)
    # end
    pdx_points = build_points_from_polygon(pdx.city_boundaries.first.boundary.as_text)

    render json: {
      points: pdx_points
    }
  end

  private

  def build_points_from_polygon(text)
    lat_long_pairs = text.match(/\(\((.*)\)\)/)[1].split(',').map do |b|
      b.split.reverse.map(&:to_f)
    end
  end
end