class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :email
      t.date :start_date
      t.date :end_date
      t.text :requirements
      t.integer :post_id

      t.timestamps null: false
    end
  end
end
