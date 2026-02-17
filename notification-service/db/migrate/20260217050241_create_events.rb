class CreateEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :events do |t|
      t.integer :type_event, default: 0
      t.string :task_id
      t.string :user_mail
      t.string :model
      t.string :brand
      t.string :price
      t.string :error_message

      t.timestamps
    end
  end
end
