class CreateActions < ActiveRecord::Migration[7.0]
  def change
    create_table :actions do |t|
      t.string :title
      t.string :level
      t.string :score
      t.string :category
      t.string :description
      t.integer :occurences

      t.timestamps
    end
  end
end
