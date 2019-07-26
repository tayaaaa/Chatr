class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.references :user, foreign_key: true
      t.integer :price
      t.integer :duration
      t.text :description
      t.integer :maxbooking

      t.timestamps
    end
  end
end
