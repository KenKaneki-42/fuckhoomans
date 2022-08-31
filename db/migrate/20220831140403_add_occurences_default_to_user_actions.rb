class AddOccurencesDefaultToUserActions < ActiveRecord::Migration[7.0]
  def change
    change_column :user_actions, :user_occurences, :integer, default: 0
    change_column :user_actions, :status, :string, default: "selected"
  end
end
