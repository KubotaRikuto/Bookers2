class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    @user = current_user
    user_path(@user.id)
  end

  # sign_out後はhomeに遷移するので、デフォルト設定

  protected

  def configure_permitted_parameters
    # configで認証キーをemail => nameに変更したので、
    # sign_up時に設定するユーザー名はemailからnameになった
    # ストロングパラメータで認証キーではないカラム(name)の操作許可をしていたので、emailに変更
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
