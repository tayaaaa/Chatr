class AddAmountpaidToUserbookings < ActiveRecord::Migration[5.2]
  def change
    add_column :userbookings, :amountpaid, :integer
  end
end
