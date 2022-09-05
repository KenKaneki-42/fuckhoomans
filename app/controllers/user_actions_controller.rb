class UserActionsController < ApplicationController
  def index
    if params[:category] == 'transport'
      @user_actions = UserAction.joins(:action).where(category: 'transport', user: current_user)
    elsif params[:category] == 'food'
      @user_actions = UserAction.joins(:action).where(category: 'food', user: current_user)
    elsif params[:category] == 'digital'
      @user_actions = UserAction.joins(:action).where(category: 'digital', user: current_user)
    elsif params[:category] == 'household'
      @user_actions = UserAction.joins(:action).where(category: 'household', user: current_user)
    else
      @user_actions = UserAction.joins(:action).where(user: current_user)
    end
    # @transport_actions = UserAction.joins(:action).where(category: 'transport', status: 'selected')
    # @food_actions = UserAction.joins(:action).where({ category: 'food', status: 'selected' })
    # @digital_actions = UserAction.joins(:action).where({ category: 'digital', status: 'selected' })
    # @household_actions = UserAction.joins(:action).where({ category: 'household', status: 'selected' })
    @last_actions = UserAction.includes(:action).where(user: current_user).last(3)
    @user_infos = current_user
  end

  def show
    @user_action = UserAction.includes(:action).find(params[:id])
  end

  def create
    @new_user_action = UserAction.new(get_params)
    @new_user_action.status = 'selected'
    @new_user_action.user_occurences = 0
    @new_user_action.user = current_user #.valid?       } if not saving
    if @new_user_action.save             #.errors       }
      redirect_to user_actions_path
    else
      raise
    end
  end

  def update
    user_action = UserAction.includes(:action).find(params[:id])
    user_action.user_occurences = user_action.user_occurences + 1
    if user_action.action.occurences == user_action.user_occurences
      user_action.status = "validated"
    else
      user_action.status = "in_progress"
    end

    if user_action.save
      redirect_to actions_path
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def get_params
    params.require(:user_action).permit(:action_id, :score, :category, :title, :status, :user_occurences)
  end
end
