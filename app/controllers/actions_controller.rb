class ActionsController < ApplicationController

  def index
    user_actions_validated = UserAction.where(status: "validated", user_id: current_user.id)
    user_actions_selected = UserAction.where(status: "selected", user_id: current_user.id)
    usr_action_valdid_slct = []
    user_actions_validated.each do |user_action|
      usr_action_valdid_slct << user_action.action_id
    end
    user_actions_selected.each do |user_action|
      usr_action_valdid_slct << user_action.action_id
    end
    if params[:category].present?

      @actions = Action.where(level: define_actions_to_see, category: define_category)
      @actions = @actions.reject { |action| usr_action_valdid_slct.include?(action.id) }

    else
      @actions = Action.all
      @actions = @actions.reject { |action| usr_action_valdid_slct.include?(action.id) }
    end
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
