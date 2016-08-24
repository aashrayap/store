class UsersController < ApplicationController

  def index
    @user=User.find_by_sql ["SELECT DISTINCT users.id,first_name,last_name,cities.name,checkout_date FROM users JOIN addresses ON (users.id=user_id) JOIN cities ON (city_id=cities.id) JOIN orders ON (users.id=orders.user_id)"]
  end

  def create
    @user = User.new(
      first_name: params[:user][:first_name],
      last_name: params[:user][:last_name],
      email: params[:user][:email])
    if @user.save
      flash.notice= "success"
      redirect_to user_path(@user.id)
    else
      flash.now[:error] = "error"
      render :new
    end
  end

  def new
    @user=User.new
  end
  
  def show
    @user=User.find(params[:id])
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    @user.update ({:first_name => params[:user][:first_name]})
    @user.update ({:last_name => params[:user][:last_name]})
    @user.update ({:email => params[:user][:email]})
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:first_name,:last_name,:email)
  end
end

