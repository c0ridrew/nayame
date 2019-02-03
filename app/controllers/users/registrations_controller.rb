class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
  end

  def edit
  end

  def update
    user = current_user
    if user.update_attributes(update_params)
      redirect_to posts_path, flash: {info: 'プロフィールを変更しました。'}
    else
      redirect_to edit_user_registration_path, flash: {error: 'すでに使用されているメールアドレスです。'}
    end
  end

  def destroy

  end

  def after_sign_in_path_for(resource)
    posts_path
  end

  private
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :uid, :provider])
    end

    def update_params
      params.require(:user).permit(:name, :email, :password)
    end

end
