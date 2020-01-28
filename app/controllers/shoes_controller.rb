class ShoesController < ApplicationController

  def index
    @shoes = Shoe.all
  end

  def new
    @shoe = Shoe.new
  end

  def create
    @shoe = Shoe.new(params.require(:shoe).permit(:brand, :condition, :price, :color))
    if @shoe.save
      redirect_to shoe_path(@shoe)
    else

      render :new
    end
  end

  def edit
    @shoe = Shoe.find(params[:id])
  end

  def update
    @shoe = Shoe.find(params[:id])
    @shoe.update(params.require(:shoe).permit(:brand, :condition, :price, :color))
    redirect_to @shoe
  end

  def destroy   #'/shoes/:id'
      @shoe = Shoe.find(params[:id])
      @shoe.destroy
      redirect_to shoes_path
  end

  def show
    @shoe = Shoe.find(params[:id])
  end

  def expensive
    @shoe = Shoe.most_expensive
  end
end