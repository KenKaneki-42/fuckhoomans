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

  def create
    @new_user_action = UserAction.new(get_params)
    @new_user_action.status = 'unvalidated'
    @new_user_action.user_occurences = 0
    @new_user_action.user_id = current_user
    if @new_user_action.save
      redirect_to user_actions_path
    else
      raise
    end
  end


  def get_params
    params.require(:user_action).permit(:user_id, :action_id, :score, :category, :title, :status, :user_occurences)
  end
end
