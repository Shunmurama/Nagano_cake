class Public::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.all
  end

  def create
    @item = Item.find(cart_item_params[:item_id])
    @item.save
    redirect_to cart_items_path
  end

  def update
  end

  def destroy
    cart_item = CartItem.find(cart_item_params)
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    cart_items = CartItem.all
    cart_items.destroy
    redirect_to cart_items_path
  end



  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
