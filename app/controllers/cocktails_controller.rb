class CocktailsController < ApplicationController


  def index
    @cocktails = Cocktail.all
    respond_to do |format|
      format.html
      format.json { render json: @cocktails }
    end


    if params[:query].present?
      @cocktails = Cocktail.where('name ILIKE ?', "%#{params[:query]}%")
    else
      @cocktails = Cocktail.all
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "#{@cocktail.name}"   # Excluding ".pdf" extension.
      end
    end

  end


  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(params_cocktail)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
     @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to cocktails_path
  end


private

def params_cocktail
  params.require(:cocktail).permit(:name, :image, :photo)
end

end
