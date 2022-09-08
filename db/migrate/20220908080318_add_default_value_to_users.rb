class AddDefaultValueToUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :transport_level, :string, default: "beginner"
    change_column :users, :home_level, :string, default: "beginner"
    change_column :users, :numeric_level, :string, default: "beginner"
    change_column :users, :food_level, :string, default: "beginner"
  end
end
