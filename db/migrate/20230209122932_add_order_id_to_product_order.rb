class AddOrderIdToProductOrder < ActiveRecord::Migration[7.0]
  def change
    add_reference :product_orders, :order, null: false, foreign_key: true
  end
end
