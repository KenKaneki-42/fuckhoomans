class RemoveTotalScoreToUserActionss < ActiveRecord::Migration[7.0]
  def change
    remove_column :user_actions, :total_score
  end
end
