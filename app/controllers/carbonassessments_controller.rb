class CarbonassessmentsController < ApplicationController

  def show

  end

  def create
    @new_carbonassessment = Carbonassessment.new(get_params)
    @new_carbonassessment.user = current_user
    if @new_carbonassessment.save
      redirect_to dashboard_path
    else
      raise
    end
  end


  private

  def get_params
    params.require(:user_action).permit(:action_id, :score, :category, :title, :status, :user_occurences)
  end

end
