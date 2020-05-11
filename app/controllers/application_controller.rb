class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def after_sign_up_path_for(resource)
    posts_path # サインアップ後に遷移するpath
  end
  def after_sign_in_path_for(resource)
    posts_path # ログイン後に遷移するpath
  end

  def after_sign_out_path_for(resource)
    root_path # ログアウト後に遷移するpath
  end
  def configure_permitted_parameters
	devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :name_kana, :nickname, :profile_image, :introduction, :one_word])
  end
end
