class CreateCityBoundaries < ActiveRecord::Migration
  def up
    create_table :city_boundaries do |t|
      t.integer :city_id
      t.polygon :boundary
    end
    remove_column :cities, :boundary
  end

  def down
    drop_table :city_boundaries
    add_column :cities, :boundary, :polygon, srid: 4326
  end
end
