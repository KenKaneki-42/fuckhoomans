class AddExplicationToAction < ActiveRecord::Migration[7.0]
  def change
    add_column :actions, :explication, :string
  end
end
