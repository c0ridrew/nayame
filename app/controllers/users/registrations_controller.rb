class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
  end

  def edit
  end

  def update
  end

  def after_sign_in_path_for(resource)
    nayame_path(resource)
  end

  private
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end

end
