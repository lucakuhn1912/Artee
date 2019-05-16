class CreateLeases < ActiveRecord::Migration[5.2]
  def change
    create_table :leases do |t|
      t.date :start
      t.date :end
      t.float :total_price
      t.references :user, foreign_key: true
      t.references :art, foreign_key: true

      t.timestamps
    end
  end
end
