class AddTotalScoreToUserActions < ActiveRecord::Migration[7.0]
  def change
    add_column :user_actions, :total_score, :integer
  end
end
