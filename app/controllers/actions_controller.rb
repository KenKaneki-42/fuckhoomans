class ActionsController < ApplicationController

  def index
    @transport_actions = Action.where({ category: 'transport' })
    @food_actions = Action.where({ category: 'food' })
    @digital_actions = Action.where({ category: 'digital' })
    @household_actions = Action.where({ category: 'household' })
  end
  def show
    @action = Action.find(params[:id])
    @user = current_user
    @user_action = UserAction.new()
  end
end
