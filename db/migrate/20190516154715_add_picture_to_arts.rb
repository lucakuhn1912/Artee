class AddPictureToArts < ActiveRecord::Migration[5.2]
  def change
    add_column :arts, :picture, :string
  end
end
