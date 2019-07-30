class CreateUserbookings < ActiveRecord::Migration[5.2]
  def change
    create_table :userbookings do |t|
      t.references :student, foreign_key: { to_table: :users }
      t.references :lesson, foreign_key: true
      t.text :note
      t.datetime :date_booked
      t.boolean :completedstu, :default => false
      t.boolean :completedteach, :default => false

      t.timestamps
    end
  end
end
