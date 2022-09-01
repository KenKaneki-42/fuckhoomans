class AddGainCarbonToActions < ActiveRecord::Migration[7.0]
  def change
      add_column :actions, :carbongain, :integer, default: 0
  end
end
