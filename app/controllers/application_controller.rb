class ApplicationController < ActionController::Base
  #ログインしていない場合はトップページとアバウトページのみ遷移可能
  before_action :authenticate_user!, except: [:top, :about]

  #ログインしている場合は商品一覧ページへ
  def after_sign_in_path_for(resource)
    items_path
  end

  protected

  # 新規登録の保存機能
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postcode, :address, :phone_number])

      #sign_up時のパラメータ(メールアドレス)
  		devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end
end
