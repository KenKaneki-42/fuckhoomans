class SetDefautscoresToScores < ActiveRecord::Migration[7.0]
  def change
    change_column :scores, :transport_score, :integer, default: 0
    change_column :scores, :food_score, :integer, default: 0
    change_column :scores, :household_score, :integer, default: 0
    change_column :scores, :digital_score, :integer, default: 0
    change_column :scores, :total_score, :integer, default: 0
  end
end
