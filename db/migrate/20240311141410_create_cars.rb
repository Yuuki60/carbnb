class CreateCars < ActiveRecord::Migration[7.1]
  def change
    create_table :cars do |t|
      t.string :name
      t.string :description
      t.string :text
      t.integer :price_per_day
      t.string :user_id

      t.timestamps
    end
  end
end
