class AddTypeToProperties < ActiveRecord::Migration[6.0]
  def change
    change_table :site_properties do |t|
      t.boolean :value_type, default: SiteProperty::TEXT
    end
  end
end
