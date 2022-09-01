class AddCarbongainToUserActions < ActiveRecord::Migration[7.0]
  def change
    add_column :user_actions, :carbongain, :integer
  end
end
