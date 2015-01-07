class CreateLocales < ActiveRecord::Migration
  def up
    create_table :locales do |t|
      t.column :name, :string, default: '', null: false
      t.column :location, :point, srid: 4326
      t.column :city_id, :integer
    end
  end

  def down
    drop_table :locales
  end
end
