class CreateImages < ActiveRecord::Migration[6.0]
  def change
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
