class AddColumnToConversationsTable < ActiveRecord::Migration[5.2]
  def change
    add_reference :conversations, :user1, foreign_key: { to_table: :users }
  end
end
