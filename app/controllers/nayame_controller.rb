class NayameController < ApplicationController
  before_action :authenticate

  def index
  end

  def authenticate
    redirect_to new_user_registration_path, flash: {error: 'ログインしていません'} unless user_signed_in?
  end
end