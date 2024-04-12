class AccountController < ApplicationController
    before_action :authenticate_user! # Ensure user is logged in
  
    def index
      @user = current_user
    end
  
    def update_address
      @user = current_user
      if @user.update(user_params)
        redirect_to "/", notice: 'Address updated successfully.'
      else
        render :index
      end
    end

    def sign_out
        reset_session
        redirect_to '/', notice: 'Customer information updated successfully.'
    end

    def my_orders
      @orders = current_user.orders.includes(:order_items).order(created_at: :desc)
    end
    
  
    private
  
    def user_params
      params.require(:user).permit(:address, :city, :province_id)
    end
  end
  
  