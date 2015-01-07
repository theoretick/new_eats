class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name, :string, default: '', null: false
      t.point :location, :point, srid: 4326
      t.polygon :boundary
      t.text :viewport
    end
  end
end