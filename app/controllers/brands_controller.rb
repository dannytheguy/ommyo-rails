class BrandsController < ApplicationController
  respond_to :html, :json

  layout 'member'

  before_action :set_brand, only: [:show]

  def show
    @omms = @brand.omms.paginate(page: params[:page])
    respond_with(@brand)
  end

  def index
    @brands = Brand.where(disabled: false)
    respond_with(@brands)
  end

  def new
  end

  def create
    redirect_to omms_path, flash: { success: "Thanks, #{ params[:name] } has been added to our to-do list!" }
  end

  private
    def set_brand
      @brand = Brand.find(params[:id])
    end
end
