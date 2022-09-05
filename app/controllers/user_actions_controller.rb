class UserActionsController < ApplicationController
  def index
    @transport_actions = UserAction.joins(:action).where(category: 'transport', status: 'selected')
    @food_actions = UserAction.joins(:action).where({ category: 'food', status: 'selected' })
    @digital_actions = UserAction.joins(:action).where({ category: 'digital', status: 'selected' })
    @household_actions = UserAction.joins(:action).where({ category: 'household', status: 'selected' })
    @user_infos = current_user
    @last_actions = UserAction.includes(:action).where(user: current_user).last(3)
  end


  def dashboard
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
      redirect_to user_actions_path
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
    score_table.total_score += user_action.score

    if user_action.category == 'transport'
      score_table.transport_score += user_action.score
      if score_table.transport_score < 20
        current_user.transport_level = 'beginner'
      elsif score_table.transport_score >= 20 && score_table.transport_score < 60
        current_user.transport_level = 'intermediate'
      else
        current_user.transport_level = 'advanced'
      end
    elsif user_action.category == 'food'
      score_table.food_score += user_action.score
      if score_table.food_score < 20
        current_user.food_level = 'beginner'
      elsif score_table.food_score >= 20 && score_table.food_score < 60
        current_user.food_level = 'intermediate'
      else
        current_user.food_level = 'advanced'
      end
    elsif user_action.category == 'digital'
      score_table.digital_score += user_action.score
      if score_table.digital_score < 20
        current_user.numeric_level = 'beginner'
      elsif score_table.digital_score >= 20 && score_table.digital_score < 60
        current_user.numeric_level = 'intermediate'
      else
        current_user.numeric_level = 'advanced'
      end
    elsif user_action.category == 'home'
      score_table.household_score += user_action.score
      if score_table.household_score < 20
        current_user.home_level = 'beginner'
      elsif score_table.household_score >= 20 && score_table.household_score < 60
        current_user.home_level = 'intermediate'
      else
        current_user.home_level = 'advanced'
      end
    else
      p "the category doesn't exist"
    end

    current_user.save
    score_table.save
  end
end
