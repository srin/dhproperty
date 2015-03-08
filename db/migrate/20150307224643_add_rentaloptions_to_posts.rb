class AddRentaloptionsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :longterm, :boolean
    add_column :posts, :shortterm, :boolean
    add_column :posts, :holiday, :boolean
  end
end
