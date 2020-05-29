class UnitsController < ApiController

  def index
    @units = Unit.all.order(id: :asc)
    render json: @units
  end

  def show
    @unit = Unit.find(params[:id])
    render json: @unit.to_json(:include => { :direct_counters => { include: :counter_unit },
                                            :tactical_counters => { include: :counter_unit}, 
                                            :direct_countered => { include: :countered_unit }, 
                                            :tactical_countered => { include: :countered_unit }, 
                                            :civilizations => { } ,
                                            :upgrade_tree => { include: :units }
                                          }
                              )
  end

  def search
    @units = Unit.all.order(id: :asc)
    if search_params[:building]
      @units = @units.where(building: search_params[:building])
    end
    if search_params[:civilization]
      @units =  @units.includes(:civilizations).where(civilizations: {id: search_params[:civilization]})
    end
    render json: @units
  end

  private

  def search_params
    params.permit(:civilization, :building)
  end

end
