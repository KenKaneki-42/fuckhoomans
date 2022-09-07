class CarbonassessmentsController < ApplicationController

  def new
    @carbon_assessment = Carbonassessment.new
  end

  def create
    @carbon_assessment = Carbonassessment.new(get_params)
    @carbon_assessment.user = current_user
    if @carbon_assessment.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private

  def get_params
    params.require(:carbonassessment).permit(:bike, :bus, :plane, :car,
                                             :email, :streaming, :devise, :second_hand,
                                             :red_meat, :white_meat, :oil, :dairy, :house_size,
                                             :house_heated, :renewable_energy, :people_number)
  end

end

