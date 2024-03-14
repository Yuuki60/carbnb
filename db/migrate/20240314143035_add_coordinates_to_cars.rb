class AddCoordinatesToCars < ActiveRecord::Migration[7.1]
  def change
    add_column :cars, :latitude, :float
    add_column :cars, :longitude, :float
    add_column :cars, :location, :string
  end
end
