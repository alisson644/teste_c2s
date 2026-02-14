class CreateVehicles < ActiveRecord::Migration[8.0]
  def change
    create_table :vehicles do |t|
      t.string :link
      t.string :model
      t.string :price
      t.string :brand
      t.string :user_id

      t.timestamps
    end
  end
end
