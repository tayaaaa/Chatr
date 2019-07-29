class AddForeignKeyToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :userbookings, :user, foreign_key: true
  end
end
