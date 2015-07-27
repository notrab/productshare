class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :tagline
      t.string :url
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :products, :user_id
  end
end
