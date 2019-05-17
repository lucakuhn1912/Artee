class RemovePhotoFromArts < ActiveRecord::Migration[5.2]
  def change
    remove_column :arts, :photo, :string
  end
end
