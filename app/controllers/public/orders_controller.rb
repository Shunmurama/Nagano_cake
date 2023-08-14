class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customers = Customer.all
    @customer = Customer.find(params[:id])
  end

  def confirm
    @order = Order.new
    @order_items = OrderItem.all
    @customers = Customer.all
    @tax = 1.1
  end

  def thanks
  end

  def create
    @order = current_customer.orders.new(order_params)
      @cart_items = current_customer.cart_items.all
      if @order.save
         cart_items.each do |cart_item|
           order_item = OrderItem.new
           order_item.item_id = cart_item.item_id
           order_item.order_id = @order.id
           order_item.amount = cart_item.amount
           order_item.purchase_price  = cart_item.item.price
           order_item.save
      end 
         redirect_to orders_confirm_path
    
  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:customer_id,:how_to_pay_method)
  end
end
