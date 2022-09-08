class ActionsController < ApplicationController

  def index
    @actions = Action.includes(:user_actions).where(user_actions: { user_id: nil })
    return unless params[:category].present?

    @actions = @actions.where(category: define_category)
  end

  def show
    @action = Action.find(params[:id])
    @user_action = UserAction.new()
  end

  private

  def define_actions_to_see
    case current_user.send("#{define_category}_level")
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
      "numeric"
    when "household"
      "home"
    end
  end
end
