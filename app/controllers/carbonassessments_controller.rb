class CarbonassessmentsController < ApplicationController

  def new
    @carbon_assessment = Carbonassessment.new
  end

  def create
    @carbon_assessment = Carbonassessment.new(get_params)
    @carbon_assessment.user = current_user
    ####before merge ^^^^^^^^^^^^^^^^
    para = get_params
    @transport_score = [para[:bike].to_i, para[:bus].to_i, para[:plane].to_i, para[:car].to_i].reduce(:+)
    @digital_score = [para[:email].to_i, para[:streaming].to_i, para[:devise].to_i, para[:second_hand].to_i].reduce(:+)
    @food_score = [para[:red_meat].to_i, para[:white_meat].to_i, para[:oil].to_i, para[:dairy].to_i].reduce(:+)
    @household_score = [para[:house_heated].to_i, para[:renewable_energy].to_i, para[:house_size].to_i, para[:people_number].to_i].reduce(:+)
    scores_array = [@transport_score, @digital_score, @food_score, @household_score]
    winning_category = ""



    puts "TRANSPORT SCORE"
    case scores_array.max
    when @transport_score
      winning_category = "transport"
    when @digital_score
      winning_category = "numeric"
    when @food_score
      winning_category = "food"
    when @household_score
      winning_category = "home"
    end


    puts "1211211111111111111111111111"
    puts winning_category

    @actions = Action.where(level: "beginner", category: winning_category)
    @actions[0..2].each do |action|
      UserAction.create(
                        action_id: action.id,
                        score: action.score,
                        category: action.category,
                        title: action.title,
                        user_occurences: 0,
                        status: "selected",
                        user_id: current_user.id,
                      )
    end

    # before merge vvvvvvvvvvvvvv
    @carbon_assessment.save
    redirect_to dashboard_path
    # else
    #   render :new
    # end
  end

  private

  def get_params
    params.require(:carbonassessment).permit(
                                              :bike, :bus, :plane, :car,
                                              :email, :streaming, :devise, :second_hand,
                                              :red_meat, :white_meat, :oil, :dairy, :house_size,
                                              :house_heated, :renewable_energy, :people_number
                                            )
  end

end
