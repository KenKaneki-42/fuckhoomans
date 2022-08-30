class CreateScores < ActiveRecord::Migration[7.0]
  def change
    create_table :scores do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :transport_score
      t.integer :food_score
      t.integer :household_score
      t.integer :digital_score
      t.integer :total_score

      t.timestamps
    end
  end
end
