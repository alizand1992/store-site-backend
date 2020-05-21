class CreateItemAttributes < ActiveRecord::Migration[6.0]
  def change
    create_table :item_attributes do |t|
      t.references :item, null: false
      t.string :name, null: false
      t.string :value, default: ''

      t.timestamps
    end

    add_index :item_attributes, :name
    add_index :item_attributes, %i[item_id name]
  end
end
