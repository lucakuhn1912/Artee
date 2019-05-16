class CreateArts < ActiveRecord::Migration[5.2]
  def change
    create_table :arts do |t|
      t.string :name
      t.text :description
      t.string :artist
      t.string :location
      t.float :price
      t.float :value
      t.boolean :availability
      t.references :owner, index: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
