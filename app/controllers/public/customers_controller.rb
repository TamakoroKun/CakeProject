class Public::CustomersController < ApplicationController
    before_action :authenticate_customer!
    
    def show
      @customer = Customer.find(current_customer.id)
    end
    
    def edit
      @customer = Customer.find(current_customer.id)
    end
    
    def update
      if @customer.update(customer_params)
        redirect_to customer_path(current_customer), notice: "You have updated customer successfully."
      else
        render "edit"
      end
    end
    
    def unsubscribe
    end
    
    def withdraw
      if @customer.update(customer_params)
        redirect_to root_path, notice: "You have withdrawn successfully."
      else
        render "show"
      end
    end
    
    private
    
    def customer_params
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :postcode, :address, :phone_number)
    end

end