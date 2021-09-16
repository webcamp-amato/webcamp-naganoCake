class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  #ログイン後の画面遷移先指定
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_orders_path
    when Customer
      items_path
    end
  end

  protected

  # 新規登録の保存機能
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postcode, :address, :phone_number])

    #sign_up時のパラメータ(メールアドレス)
  	devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end
end
