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

    if @user_action.user_occurences >= @user_action.action.occurences
      @user_action.status = "validated"
    else
      @user_action.status = "in_progress"
    end

    if @user_action.save
      if @user_action.status == "validated"
        update_score(@user_action)
      end
      redirect_to actions_path
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def get_params
    params.require(:user_action).permit(:action_id, :score, :category, :title, :status, :user_occurences)
  end

  def update_score(user_action)
    score_table = current_user.score
    score_table.score_total += user_action.score

    if user_action.category == "transport"
      score_table.transport_score += user_action.score
    elsif user_action.category == "food"
      score_table.food_score += user_action.score
    elsif user_action.category == "numeric"
      score_table.digital_score += user_action.score
    elsif user_action.category  == "home"
      score_table.household_score += user_action.score
    else
      p "the category doesn't exist"
    end

  end
end
