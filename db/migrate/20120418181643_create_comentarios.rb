class SitePosition < ActiveRecord::Migration
  def change
    change_table :comentarios do |t|
      t.column :latitud, :decimal
      t.column :longitud, :decimal
      t.column :zoom, :integer

      t.timestamps
    end
  end
end
