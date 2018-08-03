class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :office_location
      t.string :phone_number
      t.integer :user_id

      t.timestamps
    end
  end
end
