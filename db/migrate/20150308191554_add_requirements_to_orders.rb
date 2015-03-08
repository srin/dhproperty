class AddRequirementsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :requirements, :text
  end
end
