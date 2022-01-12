class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :currency_type, default: 0, null: false
      t.decimal :gross_amount, null: false
      t.decimal :discount_amount
      t.decimal :net_amount, null: false
      t.bigint :category_id

      t.timestamps
    end
    add_foreign_key :orders, :categories
  end
end
