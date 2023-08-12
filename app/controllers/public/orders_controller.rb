class Public::OrdersController < ApplicationController
  def new
    @order = Order.new(order_params)
    @customers = Customer.all
    @customer = Customer.find(params[:id])
  end

  def confirm
    @order = Order.new
    binding.pry
    @order_items = OrderItem.all
    @customers = Customer.all
    @tax = 1.1
  end

  def thanks
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to orders_confirm_path
    end
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
