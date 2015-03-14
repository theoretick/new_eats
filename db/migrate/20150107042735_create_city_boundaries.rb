class CreateCityBoundaries < ActiveRecord::Migration
  def up
    create_table :city_boundaries do |t|
      t.integer :city_id
      t.polygon :boundary, :null => false, :srid => 4326
      t.point :location, srid: 4326
      t.timestamps
    end
    remove_column :cities, :boundary

    add_index :city_boundaries, :city_id
    add_index :city_boundaries, :boundary, :spatial => true
  end

  def down
    drop_table :city_boundaries

    add_column :cities, :boundary, :polygon, srid: 4326
  end
end
