class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # configで認証キーをemail => nameに変更したので、
    # sign_up時に設定するユーザー名はemailからnameになった
    # ストロングパラメータで認証キーではないカラム(name)の操作許可をしていたので、emailに変更
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
