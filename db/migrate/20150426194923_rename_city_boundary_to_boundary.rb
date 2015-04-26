class RenameCityBoundaryToBoundary < ActiveRecord::Migration
  def up
    rename_table :city_boundaries, :boundaries

    add_column :boundaries, :boundable_type, :string, null: false, default: 'City'
    rename_column :boundaries, :city_id, :boundable_id
  end
  def down
    rename_table :boundaries, :city_boundaries

    remove_column :city_boundaries, :boundable_type
    rename_column :city_boundaries, :boundable_id, :city_id
  end
end
