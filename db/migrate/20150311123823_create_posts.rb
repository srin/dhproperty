class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.text :access_info
      t.string :country
      t.string :state
      t.string :city
      t.string :postcode
      t.float :latitude
      t.float :longitude
      t.integer :bedrooms
      t.boolean :sf_entry
      t.boolean :sf_bathroom
      t.boolean :sf_bedroom
      t.boolean :roll_shower
      t.string :price
      t.string :price_info
      t.string :proptype
      t.boolean :longterm
      t.boolean :shortterm
      t.boolean :holiday
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
