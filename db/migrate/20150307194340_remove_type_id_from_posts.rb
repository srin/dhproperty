class RemoveTypeIdFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :type_id, :integer
  end
end
