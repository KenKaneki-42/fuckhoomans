class Action < ApplicationRecord
  has_many :users
  has_many :useractions

  has_one_attached :photo
end
