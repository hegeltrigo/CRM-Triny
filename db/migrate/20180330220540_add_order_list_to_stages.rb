class AddOrderListToStages < ActiveRecord::Migration[5.1]
  def change
    add_column :stages, :order_list, :text
  end
end
