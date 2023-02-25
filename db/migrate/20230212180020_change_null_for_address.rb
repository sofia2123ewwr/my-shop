class ChangeNullForAddress < ActiveRecord::Migration[7.0]
  def change
    change_column_null :addresses, :country, false
    change_column_null :addresses, :city, false
    change_column_null :addresses, :street, false
  end
end
