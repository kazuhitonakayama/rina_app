class PlacesController < ApplicationController
  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.user_id = current_user.id
    if @place.save
      redirect_to controller: :users, action: :mypage
    else
      render_to :action => "new"
    end
  end

  def show
    @place = Place.find(params[:id])
    @genres = Genre.where(user_id: @place.user_id)
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])
    if @place.update(place_params)
      redirect_to :action => "show", :id => @place.id
    else
      redirect_to :action => "new"
    end
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    redirect_to controller: :users, action: :mypage
  end

  private
  def place_params
    params.require(:place).permit(:name,:day,:image,:comment,:genre_id,:rate,:public_state)
  end


end
