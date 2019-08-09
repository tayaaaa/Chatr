class DeleteColumnFromReply < ActiveRecord::Migration[5.2]
  def change
    remove_column :replies, :date_published
  end
end
