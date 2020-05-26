class UnitsController < ApiController

  def index
    @units = Unit.all
    render json: @units
  end

  def show
    @unit = Unit.find(params[:id])
    render json: @unit.to_json(:include => { :direct_counters => { include: :counter_unit }, :tactical_counters => { include: :counter_unit}})
  end
  
end
