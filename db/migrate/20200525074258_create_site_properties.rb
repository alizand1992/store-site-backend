class CreateSiteProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :site_properties do |t|
      t.string :name, null: false
      t.text :value

      t.timestamps
    end

    add_index :site_properties, :name, unique: true
  end
end
