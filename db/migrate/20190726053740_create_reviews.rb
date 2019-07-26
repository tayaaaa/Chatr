class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :userbooking, foreign_key: true
      t.integer :stars
      t.text :content
      t.datetime :date_published

      t.timestamps
    end
  end
end
