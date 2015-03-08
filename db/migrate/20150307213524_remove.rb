class Remove < ActiveRecord::Migration
  def change
  	remove_column :posts, :rentaltype, :string
  end
end
