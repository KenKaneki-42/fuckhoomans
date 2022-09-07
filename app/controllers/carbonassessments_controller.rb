class CarbonassessmentsController < ApplicationController

  def show
    @carbonassessment = Carbonassessment.where(user: current_user)
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
    params.require(:carbonassessment).permit(:bike, :bus, :plane, :car,
                                             :email, :streaming, :devise, :second_hand,
                                             :red_meat, :white_meat, :oil, :dairy, :house_size,
                                             :house_heated, :renewable_energy, :people_number)
  end

end

# create_table "carbonassessments", force: :cascade do |t|
#   t.bigint "user_id", null: false
#   t.string "bike"
#   t.string "bus"
#   t.string "plane"
#   t.string "car"
#   t.string "email"
#   t.string "streaming"
#   t.string "devise"
#   t.string "second_hand"
#   t.string "red_meat"
#   t.string "white_meat"
#   t.string "oil"
#   t.string "dairy"
#   t.string "house_size"
#   t.string "house_heated"
#   t.string "renewable_energy"
#   t.string "people_number"

#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.index ["user_id"], name: "index_carbonassessments_on_user_id"
# end
