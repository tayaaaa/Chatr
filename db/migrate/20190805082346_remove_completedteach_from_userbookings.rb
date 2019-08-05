class RemoveCompletedteachFromUserbookings < ActiveRecord::Migration[5.2]
  def change
    remove_column :userbookings, :completedteach
  end
end
