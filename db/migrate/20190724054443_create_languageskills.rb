class CreateLanguageskills < ActiveRecord::Migration[5.2]
  def change
    create_table :languageskills do |t|
      t.references :profile, foreign_key: true
      t.boolean :teaches, :default => false
      t.integer :proficiency

      t.timestamps
    end
  end
end
