class AddPositionToSites < ActiveRecord::Migration
  def change
    add_column :sites, :latitud, :decimal

    add_column :sites, :longitud, :decimal

    add_column :sites, :zoom, :integer

  end
end
