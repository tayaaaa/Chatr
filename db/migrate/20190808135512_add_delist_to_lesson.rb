class AddDelistToLesson < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :delist, :boolean, :default => false
  end
end

