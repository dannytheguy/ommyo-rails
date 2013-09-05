class BrandsController < ApplicationController
  respond_to :html, :json

  layout 'member'

  def index
    @brands = Brand.all
    respond_with(@brands)
  end

  def new
  end

  def create
    redirect_to omms_path, flash: { success: "Thanks, #{ params[:name] } has been added to our to-do list!" }
  end
end
