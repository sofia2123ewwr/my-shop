class ChangeDefaltForProduct < ActiveRecord::Migration[7.0]
  def change
    change_column_default :products, :price, from: nil, to: 0.0
  end
end
