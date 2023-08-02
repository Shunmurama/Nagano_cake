class Public::CustomersController < ApplicationController


  def show
    @customer = current_customer
    @customers = Customer.all
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
   if @customer.update(customer_params)
     redirect_to home_path
   else
     render :edit
   end
  end

  def withdraw
  end

  def unsubscribe
  end

  private
   def customer_params
     params.require(:customer).permit(:last_name, :first_name, :last_name_kane, :first_name_kana, :email, :encrypted_password, :postal_code, :address,:elephone_number)
   end

end
