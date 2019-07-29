class RemoveColumnFromUserbookings < ActiveRecord::Migration[5.2]
  def change
    remove_column :userbookings, :student_id
  end
end
