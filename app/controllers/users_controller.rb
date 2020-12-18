class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user=User.find(params[:id])
    @genres=Genre.where(user_id: params[:id]).or(Genre.where(user_id: 1))
    @bookmarkuser=User.find(params[:id])
    @bookmarks=@bookmarkuser.bookmarks
  end

  def index
    if params[:search] != nil && params[:search] != ''
      @users = User.where("name LIKE ? ", "%" + params[:search] + "%")
    else
      @users = User.all
    end
    @places = Place.includes(:liked_users).sort {|a,b| b.liked_users.size <=> a.liked_users.size}

  end

  def mypage
    @user=User.find(current_user.id)
    @genres=Genre.where(user_id: current_user.id).or(Genre.where(user_id: 1))
    @bookmarkuser=User.find(current_user.id)
    @bookmarks=@bookmarkuser.bookmarks
  end

  def bookmark
    @bookmarkuser=User.find(current_user.id)
    @bookmarks=@bookmarkuser.bookmarks
  end


end
