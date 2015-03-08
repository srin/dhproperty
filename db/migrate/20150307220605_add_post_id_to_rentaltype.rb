class AddPostIdToRentaltype < ActiveRecord::Migration
  def change
    add_column :rentaltypes, :post_id, :integer
  end
end
