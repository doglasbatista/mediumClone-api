class Api::V1::SessionsController < Api::V1::ApplicationController
  skip_before_action :auth_user_from_token

  def create
    user = User.find_for_database_authentication(email: params[:email])
    return invalid_login unless user && user.valid_password?(params[:password])

    sign_in(:user, user)
    render json: user
  end

  private

  def invalid_login
    render json:
    {
      errors: I18n.t('application.errors.invalid_login')
    }, status: 401
  end

end