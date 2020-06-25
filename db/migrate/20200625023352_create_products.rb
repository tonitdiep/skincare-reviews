class CreateProducts < ActiveRecord::Migration
  def change 
    create_table :products do |t|
      t.text :description
      t.integer :rating
      t.integer :price
      t.boolean :reorder 
      t.integer :user_id
    end
  end
end
