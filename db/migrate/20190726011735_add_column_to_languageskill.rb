class AddColumnToLanguageskill < ActiveRecord::Migration[5.2]
  def change
    add_column :languageskills, :language_name, :string
  end
end
