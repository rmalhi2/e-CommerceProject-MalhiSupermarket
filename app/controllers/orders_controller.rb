class OrdersController < ApplicationController
    before_action :authenticate_user!
  
    def new
      @order = current_user.orders.build
      # Pre-fill order with user's existing information
      @order.address = current_user.address
      @order.city = current_user.city
      @order.province_id = current_user.province_id
      build_order_items(@order) # This populates the order with items from the cart.
    end
  
    def create
      @order = current_user.orders.build(order_params)
      build_order_items(@order) # Add items to the order from the cart
  
      if @order.save
        session[:cart] = {} # Clear the cart after successful order creation
        redirect_to @order, notice: 'Order was successfully created.'
      else
        render :new, alert: 'There was a problem creating your order.'
      end
    end
  
    def show
      @order = Order.find(params[:id])
      # Assuming @order has associations to fetch items, taxes, etc.
    end

    def confirm_order
        @order = Order.find(params[:id])
        # Logic to mark the order as confirmed or similar status
        flash[:notice] = "Order placed successfully! We are now processing your order and will notify you about the further details."
        redirect_to root_path
    end

    def my_orders
        @orders = current_user.orders.includes(:order_items).order(created_at: :desc)
    end
      
  
    private
  
    def build_order_items(order)
      session[:cart]&.each do |product_id, quantity|
        product = Product.find(product_id)
        order.order_items.build(product: product, quantity: quantity, price: product.product_price)
      end
      !session[:cart].nil? && !session[:cart].empty?
    end
  
    def order_params
      params.require(:order).permit(:address, :city, :province_id)
    end
  end
  