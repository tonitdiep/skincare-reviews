class ChangeColumntyeRating < ActiveRecord::Migration
  def change
    change_column :products, :rating, :float
  end
end
