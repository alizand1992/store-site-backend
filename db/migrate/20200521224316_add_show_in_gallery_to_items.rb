class AddShowInGalleryToItems < ActiveRecord::Migration[6.0]
  def change
    change_table :items do |t|
      t.boolean :show_in_gallery, null: false, default: false
    end

    add_index :items, :show_in_gallery
    add_index :items, %i[name show_in_gallery]
  end
end
