class ApplicationController < ActionController::Base
  def after_sign_in_path_for(_resource)
    days_path
  end

  def fobid_login_user
    return unless user_signed_in? == true

    redirect_to days_path
  end
end
