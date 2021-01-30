class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.string :sku
      t.integer :customer_id

      t.timestamps
    end
  end
end
