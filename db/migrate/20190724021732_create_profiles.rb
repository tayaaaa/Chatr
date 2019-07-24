class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :firstname
      t.string :lastname
      t.text :bio
      t.string :skypename

      t.timestamps
    end
  end
end
