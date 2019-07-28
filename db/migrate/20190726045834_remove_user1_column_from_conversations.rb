class RemoveUser1ColumnFromConversations < ActiveRecord::Migration[5.2]
  def change
    remove_column :conversations, :user1
  end
end
