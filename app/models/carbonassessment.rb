class Carbonassessment < ApplicationRecord
  belongs_to :user


  validates :bike, inclusion: 1..3
end
