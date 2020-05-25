class AddOrderToItemAttributes < ActiveRecord::Migration[6.0]
  def change
    change_table :item_attributes do |t|
      t.integer :order, default: 1
    end
  end
end
