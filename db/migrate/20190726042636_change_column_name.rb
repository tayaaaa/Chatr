class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :conversations, :user_id, :user1
  end
end
