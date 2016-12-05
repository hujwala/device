class Api::V1::Accounts::SessionsController < DeviseTokenAuth::SessionsController

  def resource_data(opts = {})
    opts[:resource_json] || @resource.as_json
  end

  def render_create_success
    render json: {
      user: resource_data(resource_json: @resource.token_validation_response), success: true, status: 200
    }
  end

  def render_create_error_bad_credentials
    render json: {
      errors: I18n.t("devise_token_auth.sessions.bad_credentials"), success: false, status: 401
    }
  end

  def render_destroy_success
    render json: {
    }, success: true, status: 200
  end

  def render_destroy_error
    render json: {
      errors: I18n.t("devise_token_auth.sessions.user_not_found")
    }, success: false, status: 404
  end

end