# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

City.create(name: 'Portland', location: 'POINT(-122.6764816 45.5230622)')
Locale.create(name: 'A Roadside Attraction', location: 'POINT(-122.653306 45.515642)', city_id: City.pdx.id)
Locale.create(name: 'Los Gorditos', location: 'POINT(-122.680723 45.524278)', city_id: City.pdx.id)
Locale.create(name: 'Low Brow', location: 'POINT(-122.681882 45.527089)', city_id: City.pdx.id)
