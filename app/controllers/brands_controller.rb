class BrandsController < ApplicationController
  respond_to :json

  before_action :set_brand, only: [:show]

  def show
    respond_with(@brand)
  end

  private
    def set_brand
      @brand = Brand.find(params[:id])
    end
end
