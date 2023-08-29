class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @customer = @order.customer_id

   @total = 0

    @order_items.each do |order_item|
      @total = (@total + order_item.subtotal)
    end

  end
end
