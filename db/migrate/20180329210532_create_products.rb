class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :title
      t.decimal :hourly_rate
      t.integer :user_id

      t.timestamps
    end
  end
end
