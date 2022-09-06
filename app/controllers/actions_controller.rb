class ActionsController < ApplicationController

  def index
    if params[:category].present?
      @actions = Action.where(level: define_actions_to_see, category: define_category)
    else
      @actions = Action.all
    end
  end

  def show
    @action = Action.find(params[:id])
    @user_action = UserAction.new()
  end

  private

  def define_actions_to_see
    case current_user.transport_level
    when "beginner"
      ["beginner"]
    when "intermediate"
      ["beginner", "intermediate"]
    when "advanced"
      ["beginner", "intermediate", "advanced"]
    end

  end

  def define_category
    case params[:category]
    when "transport"
      "transport"
    when "food"
      "food"
    when "digital"
      "digital"
    when "household"
      "household"
    end
  end
end
