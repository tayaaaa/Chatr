class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :conversation, foreign_key: true
      t.text :content
      t.datetime :date_sent
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
