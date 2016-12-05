class Api::V1::Accounts::PasswordsController < DeviseTokenAuth::PasswordsController

  def resource_data(opts = {})
    opts[:resource_json] || @resource.as_json
  end

  def render_create_error_missing_email
    render json: {
      errors: I18n.t("devise_token_auth.passwords.missing_email"),
      success: false, status: 401
    }
  end

  def render_create_error_missing_redirect_url
    render json: {
      errors: I18n.t("devise_token_auth.passwords.missing_redirect_url"),
      success: false, status: 401
    }
  end

  def render_create_success
    render json: {
      data: resource_data,
      message: I18n.t("devise_token_auth.passwords.sended", email: @email),
      success: true, status: 200
    }
  end

  def render_create_error
    render json: {
      errors: @errors,
      success: false,
      status: 404
    }
  end

  def edit
    redirect_to "konnexe://konnexe?reset_password_token/#{params[:reset_password_token]}"
  end

  def render_update_error_missing_password
    render json: {
      errors: I18n.t("devise_token_auth.passwords.missing_passwords"),
      success: false, status: 422
    }
  end

  def render_update_error_unauthorized
    render json: {
      success: false,
      errors: 'Unauthorized',
      status: 401
    }
  end

  def render_update_success
    render json: {
      data: resource_data,
      message: I18n.t("devise_token_auth.passwords.successfully_updated"),
      success: true, status: 200
    }
  end

  def render_update_error
    return render json: {
      errors: resource_errors,
      success: false, status: 422
    }
  end
end
