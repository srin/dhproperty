class RemoveRentaltypeIdFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :rentaltype_id, :integer
  end
end
