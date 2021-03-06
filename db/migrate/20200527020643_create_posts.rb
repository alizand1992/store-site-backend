class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :body, default: ''

      t.timestamps
    end

    add_index :posts, [:id, :title]
    add_index :posts, :string
  end
end
