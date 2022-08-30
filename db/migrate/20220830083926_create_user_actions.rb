class CreateUserActions < ActiveRecord::Migration[7.0]
  def change
    create_table :user_actions do |t|
      t.string :status
      t.integer :user_occurences
      t.integer :score
      t.references :user, null: false, foreign_key: true
      t.references :action, null: false, foreign_key: true

      t.timestamps
    end
  end
end
