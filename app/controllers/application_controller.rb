class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def after_sign_up_path_for(resource) # サインアップ後に遷移するpath
    posts_path
  end

  def after_sign_in_path_for(resource) # ログイン後に遷移するpath
    case resource
    when Admin
       admins_top_path
    when User
       posts_path
    end
  end

  def after_sign_out_path_for(resource_or_scope) # ログアウト後に遷移するpath
    if resource_or_scope == :admin
      new_admin_session_path
    else
      root_path
    end
  end

  def configure_permitted_parameters
	devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :name_kana, :nickname, :profile_image, :introduction, :one_word])
  end
end
