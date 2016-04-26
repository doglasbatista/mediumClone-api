class Api::V1::ApplicationController < ApplicationController
  respond_to :json

  before_action :auth_user_from_token

  def auth_user_from_token
    access_token = request.headers["Authorization"]

    access_token ? auth_with_access_token(access_token) : auth_error
  end

  private

  def auth_with_access_token(access_token)
    return auth_error unless access_token.include?(":")

    user = User.find_by(id: access_token.split(":").first)

    if user && Devise.secure_compare(user.access_token, access_token)
      sign_in(user, store: false)
    else
      auth_error
    end
  end

  def auth_error
    render json:
    {
      errors: I18n.t('application.errors.unauthorized')
    }, status: 401
  end
end