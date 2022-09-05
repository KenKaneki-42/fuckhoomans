class UserActionsController < ApplicationController
  def index
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
    @user_action = UserAction.includes(:action).find(params[:id])
    @user_action.user_occurences = @user_action.user_occurences + 1
    raise
    @user_action
    if @user_action.user_occurences >= @user_action.action.occurences
      @user_action.status = "validated"
      @user_action.total_score = @user_action.score # score total mis à jour aura une pertinence avec le nb occurence différent de 1
    else
      @user_action.status = "in_progress"
    end

    if @user_action.save
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
