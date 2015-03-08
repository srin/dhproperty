class DropRentaltypes < ActiveRecord::Migration
  def change
  	drop_table :rentaltypes
  end
end
