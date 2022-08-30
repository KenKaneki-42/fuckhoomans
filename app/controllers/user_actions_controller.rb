class UserActionsController < ApplicationController
  def index
    @transport_actions = UserAction.joins(:action).where({ category: 'transport' })
    @food_actions = UserAction.joins(:action).where({ category: 'food' })
    @digital_actions = UserAction.joins(:action).where({ category: 'digital' })
    @household_actions = UserAction.joins(:action).where({ category: 'household' })
    @user_infos = current_user
  end

  def show
    @action = UserAction.joins(:action).find(params[:id])
  end
end
