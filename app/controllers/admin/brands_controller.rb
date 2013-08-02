class Admin::BrandsController < Admin::BaseController
  before_action :set_brand, only: [:show, :edit, :update, :destroy]

  def index
    @brands = Brand.all
  end

  def show
  end

  def new
    @brand = Brand.new
  end

  def edit
  end

  def create
    @brand = Brand.new(brand_params)

    if @brand.save
      redirect_to [:admin, @brand], notice: 'Brand was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @brand.update(brand_params)
      redirect_to [:admin, @brand], notice: 'Brand was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @brand.destroy
    redirect_to admin_brands_url, notice: 'Brand was successfully destroyed.'
  end

  private
    def set_brand
      @brand = Brand.find(params[:id])
    end

    def brand_params
      params.require(:brand).permit(:name)
    end
end
