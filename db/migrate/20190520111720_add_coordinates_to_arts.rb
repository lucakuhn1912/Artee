class AddCoordinatesToArts < ActiveRecord::Migration[5.2]
  def change
    add_column :arts, :latitude, :float
    add_column :arts, :longitude, :float
  end
end
