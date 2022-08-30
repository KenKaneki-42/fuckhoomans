class AddCategoryTitleToUserActions < ActiveRecord::Migration[7.0]
  def change
    add_column :user_actions, :category, :string
    add_column :user_actions, :title, :string
  end
end
