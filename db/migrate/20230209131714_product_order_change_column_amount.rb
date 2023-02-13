class ProductOrderChangeColumnAmount < ActiveRecord::Migration[7.0]
  def change
    rename_column :product_orders, :amount, :quantity
  end
end
