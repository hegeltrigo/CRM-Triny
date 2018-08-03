class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.integer :deal_id

      t.timestamps
    end
  end
end