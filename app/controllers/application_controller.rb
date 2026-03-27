class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  protected

  def configure_permitted_parameters
    # 新規登録(sign_up)時にnameとlong_term_goalの保存を許可する
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :long_term_goal])
    # アカウント更新(account_update)時も許可しておくと後で目標変更ができます
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :long_term_goal])
  end
end
