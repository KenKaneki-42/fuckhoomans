class Carbonassessment < ApplicationRecord
  belongs_to :user


  validates :bike, inclusion: 1..3
  validates :bus, inclusion: 1..3
  validates :plane, inclusion: 1..3
  validates :car, inclusion: 1..3

  validates :email, inclusion: 1..3
  validates :streaming, inclusion: 1..3
  validates :devise, inclusion: 1..3
  validates :second_hand, inclusion: 1..3

  validates :red_meat, inclusion: 1..3
  validates :white_meat, inclusion: 1..3
  validates :oil, inclusion: 1..3
  validates :dairy, inclusion: 1..3

  validates :house_size, inclusion: 1..3
  validates :house_heated, inclusion: 1..3
  validates :renewable_energy, inclusion: 1..3
  validates :people_number, inclusion: 1..3

end
