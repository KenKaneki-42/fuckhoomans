class Action < ApplicationRecord
  has_many :users
  has_many :useractions
end
