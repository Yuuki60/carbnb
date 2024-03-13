class RemoveUnusedColumn < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :avatar
    remove_column :cars, :text
  end
end
