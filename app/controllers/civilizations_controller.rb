class CivilizationsController < ApplicationController

  def index
    @civilizations = Civilization.all
    render json: @civilizations
  end

end
