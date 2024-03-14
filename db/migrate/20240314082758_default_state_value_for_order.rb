class DefaultStateValueForOrder < ActiveRecord::Migration[7.1]
  def change
    change_column :orders, :state, :integer, default: 0
  end
end
