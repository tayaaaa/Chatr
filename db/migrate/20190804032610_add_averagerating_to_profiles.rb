class AddAverageratingToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :average_rating, :integer
  end
end
