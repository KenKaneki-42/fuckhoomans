class ActionsController < ApplicationController

  def index
    @actions = Action.all
  end
  def show
    @action = Action.find(params[:id])
    @user_action = UserAction.new()
  end
end
