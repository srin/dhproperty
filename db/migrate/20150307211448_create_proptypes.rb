class CreateProptypes < ActiveRecord::Migration
  def change
    create_table :proptypes do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
