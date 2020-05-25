class AddDescriptionToProperties < ActiveRecord::Migration[6.0]
  def change
    change_table :site_properties do |t|
      t.text :description, default: ''
    end
  end
end
