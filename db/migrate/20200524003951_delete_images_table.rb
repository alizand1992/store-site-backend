class DeleteImagesTable < ActiveRecord::Migration[6.0]
  def up
    remove_index :images, :name
    remove_index :images, %i[item_id name]

    drop_table :images
  end

  def down
    create_table :images do |t|
      t.string :name, null: false
      t.string :src, null: false
      t.references :item

      t.timestamps
    end

    add_index :images, :name
    add_index :images, %i[item_id name]
  end
end
