class CreateReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :replies do |t|
      t.references :review, foreign_key: true
      t.text :content
      t.datetime :date_published

      t.timestamps
    end
  end
end
