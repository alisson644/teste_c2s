class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :url
      t.integer :status, default: 0
      t.timestamp :concluded_at
      t.string :model
      t.string :brand
      t.string :price
      t.string :user_mail
      t.string :error_message

      t.timestamps
    end
  end
end
