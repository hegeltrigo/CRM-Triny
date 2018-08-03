class CreateDeals < ActiveRecord::Migration[5.1]
  def change
    create_table :deals do |t|
      t.integer :company_id
      t.string  :title
      t.decimal :total_hours
      t.integer :user_id
      t.decimal :total_price
      t.integer :stage_id

      t.timestamps
    end
  end
end
