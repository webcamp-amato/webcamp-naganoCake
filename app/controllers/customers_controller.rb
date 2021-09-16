class CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = current_customer
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def confirm
  end


  private

    def customer_params
    end
end
