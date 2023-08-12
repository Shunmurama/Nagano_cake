class Public::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.all
    @total = 0
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)

    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
       cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
       cart_item.amount += params[:cart_item][:amount].to_i
       cart_item.save
       redirect_to orders_new_path
    elsif @cart_item.save
          @cart_items = current_customer.cart_items.all
          render :index
    else
          render :index
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to cart_items_path
    else
      render :index
    end
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    @cart_items = CartItem.all
    redirect_to cart_items_path
  end

  def destroy_all
    cart_items = CartItem.all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end



  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount, :image)
  end
end
