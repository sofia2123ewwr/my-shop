class RemoveCartIdFromProductOrder < ActiveRecord::Migration[7.0]
  def change
    remove_column :product_orders, :cart_id, :bigint
  end
end
