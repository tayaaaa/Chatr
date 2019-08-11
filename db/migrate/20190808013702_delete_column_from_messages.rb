class DeleteColumnFromMessages < ActiveRecord::Migration[5.2]
  def change
    remove_column :messages, :date_sent
  end
end
