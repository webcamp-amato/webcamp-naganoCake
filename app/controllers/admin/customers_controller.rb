# frozen_string_literal: true

class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.all
    if params[:is_deleted_value]
      Customer.where(is_deleted: 'false')
    else
     Customer.all
    end
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(admin_customer_params)
      flash[:notice] = '会員情報を編集しました'
      redirect_to admin_customer_path
    else
      render :edit
    end
  end

  private

  def admin_customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postcode, :address, :phone_number, :is_deleted)
  end
end
