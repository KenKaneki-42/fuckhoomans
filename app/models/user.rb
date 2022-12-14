class User < ApplicationRecord
  after_create :create_score_table

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo
  has_many :user_actions
  has_many :Carbonassessments
  has_one :score

  private

  def create_score_table
    # assuming the name of the model is ScoreTable
    # assuming also that the attributes like transport_category, ... are by default set at 0
    Score.create(user: self)
  end
end
