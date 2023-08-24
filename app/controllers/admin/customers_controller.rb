class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
     redirect_to admin_customer_path(@customer.id)
    else
     render :edit
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kane, :first_name_kana, :email, :encrypted_password, :postal_code, :address,:elephone_number)
  end
end
