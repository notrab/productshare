class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :uid
      t.string :username
      t.string :name
      t.string :avatar

      t.timestamps null: false
    end
  end
end
