class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :phone
      t.text :address1
      t.text :address2
      t.text :city
      t.text :state
      t.integer :zip
      t.text :other_comments

      t.timestamps
    end
  end
end
