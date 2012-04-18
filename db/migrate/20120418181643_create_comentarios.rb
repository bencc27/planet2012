class CreateComentarios < ActiveRecord::Migration
  def change
    create_table :comentarios do |t|
      t.text :content
      t.integer :user_id
      t.integer :site_id

      t.timestamps
    end
  end
end
