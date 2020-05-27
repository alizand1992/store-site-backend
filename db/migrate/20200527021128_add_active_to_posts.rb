class AddActiveToPosts < ActiveRecord::Migration[6.0]
  def change
    change_table :posts do |t|
      t.boolean :active, default: false
    end

    add_index :posts, :active
    add_index :posts, [:id, :active]
    add_index :posts, [:title, :active]
  end
end
