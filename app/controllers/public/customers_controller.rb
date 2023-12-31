class Public::CustomersController < ApplicationController


  def show
    @customer = current_customer
    @customers = Customer.all
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
   if @customer.update(customer_params)
     redirect_to customers_mypage_path
   else
     redirect_to edit
   end
  end

  def withdraw
  end

  def unsubscribe
    @customer = Customer.find(current_customer.id)
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private
   def customer_params
     params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :postal_code, :address,:telephone_number, :is_deleted)
   end

end
