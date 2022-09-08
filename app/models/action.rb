class Action < ApplicationRecord
  has_many :users
  has_many :user_actions

  has_one_attached :photo
end
