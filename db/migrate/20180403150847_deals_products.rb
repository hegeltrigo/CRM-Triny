class DealsProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :deals_products do |t|
      t.integer :deal_id
      t.integer :product_id

      t.index [:deal_id, :product_id]

    end
  end
end
