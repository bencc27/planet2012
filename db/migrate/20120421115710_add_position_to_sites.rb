class AddPositionToSites < ActiveRecord::Migration
  def change
    add_column :sites, :latitud, :decimal, :default => 0

    add_column :sites, :longitud, :decimal, :default => 0

    add_column :sites, :zoom, :integer, :default => 20

  end
end
