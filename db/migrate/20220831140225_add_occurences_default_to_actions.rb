class AddOccurencesDefaultToActions < ActiveRecord::Migration[7.0]
  def change
    change_column :actions, :occurences, :integer, default: 1
  end
end
