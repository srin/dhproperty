class AddDetailsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :price_info, :string
    add_column :posts, :proptype_id, :integer
    add_column :posts, :rentaltype, :string
  end
end
