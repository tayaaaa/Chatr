class AddForeignKeyToLesson < ActiveRecord::Migration[5.2]
  def change
    add_reference :lessons, :languageskill, foreign_key: true
  end
end
