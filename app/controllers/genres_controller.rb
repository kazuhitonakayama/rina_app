class GenresController < ApplicationController
  def new
    @genre=Genre.new
    @genres = Genre.where(user_id: current_user.id) 
  end

  def create
    @genre = Genre.new(genres_params)
    @genre.user_id = current_user.id
    if @genre.save
      redirect_to controller: :places, action: :new
    else
      render_to :action => "new"
    end
  end
  
    def edit
      @genre = Genre.find(params[:id])
    end

    def index
      @genres = Genre.where(user_id: current_user.id) 
    end

    def update
      @genre = Genre.find(params[:id])
      if @genre.update(genres_params)
        redirect_to :action => "index", :id => @genre.id
      else
        redirect_to :action => "new"
      end
    end

    def destroy
      @genre = Genre.find(params[:id])
      @genre.destroy
      redirect_to action: :index
    end


  private
    def genres_params
      params.require(:genre).permit(:name,:color)
    end
end
