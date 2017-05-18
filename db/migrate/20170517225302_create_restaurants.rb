class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :desc
      t.string :addr_1
      t.string :addr_2
      t.string :addr_city
      t.string :addr_code
      t.string :addr_state
      t.string :addr_country
      t.string :phone_1

      t.timestamps
    end
  end
end
