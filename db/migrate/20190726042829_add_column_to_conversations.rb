class AddColumnToConversations < ActiveRecord::Migration[5.2]
  def change
    add_reference :conversations, :user2, foreign_key: { to_table: :users }
  end
end
