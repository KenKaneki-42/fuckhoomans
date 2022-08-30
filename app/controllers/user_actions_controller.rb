class UserActionsController < ApplicationController
  def index
    @transport_actions = UserAction.where({ category: 'transport' })
    @food_actions = UserAction.where({ category: 'food' })
    @digital_actions = UserAction.where({ category: 'digital' })
    @household_actions = UserAction.where({ category: 'household' })
  end

  def show
    @action = UserAction.find(params[:id])
  end
end
