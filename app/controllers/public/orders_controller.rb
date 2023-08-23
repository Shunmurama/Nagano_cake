class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customers = Customer.all
    @customer = current_customer
  end

  def confirm
    @order = Order.new(order_params)
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.full_name
    @order.delivery_charge = 800

    @total = 0

    @cart_items = current_customer.cart_items.all
     @cart_items.each do |cart_item|
      @total = (@total + cart_item.subtotal)
     @order.total_payment = @order.delivery_charge + @total
     end


    @customers = Customer.all

    @tax = 1.1

  end

  def thanks
  end

  def create
    @order = current_customer.orders.new(order_params)
    @cart_items = current_customer.cart_items

      if @order.save

         @cart_items.each do |cart_item|
           @order_item = OrderItem.new
           @order_item.order_id = @order.id
           @order_item.item_id = cart_item.item_id
           @order_item.amount = cart_item.amount
           @order_item.purchase_price = cart_item.item.price

           @order_item.save
         end

         current_customer.cart_items.destroy_all
         redirect_to orders_thanks_path

      end
  end

  def index
      @orders = current_customer.orders.page(params[:page])
  end

  def show
      @orders = Order.all
      @order = Order.find(params[:id])
      @order_items = @order.order_items
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :address, :postal_code, :name, :delivery_charge, :total_payment, :how_to_pay_method)
  end
end
