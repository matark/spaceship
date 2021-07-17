class SpacesController < ApplicationController
  before_action :find_space

  def show
    render json: @space
  end

  private

  def find_space
    @space = Space.find(params[:id])
  end
end
