class PropertiesController < ApplicationController
  def index
    @properties = Property.all
  end

  def show
    @property = Property.find(params[:id])
  end

	def new
  end

  def create
    @property = Property.new(property_params)

    if @property.save
      redirect_to @property
    else
      flash.now[:danger] = "Error saving property, please try again"
      render :new
    end
  end

  private
    def property_params
      params.require(:property).permit(:name, :notes, :url)
    end
end
