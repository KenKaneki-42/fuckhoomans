class CreateCarbonassessments < ActiveRecord::Migration[7.0]
  def change
    create_table :carbonassessments do |t|
      t.references :user, null: false, foreign_key: true
      t.string :bike
      t.string :bus
      t.string :plane
      t.string :car
      t.string :email
      t.string :streaming
      t.string :devise
      t.string :second_hand
      t.string :red_meat
      t.string :white_meat
      t.string :oil
      t.string :dairy
      t.string :house_size
      t.string :house_heated
      t.string :renewable_energy
      t.string :people_number

      t.timestamps
    end
  end
end
