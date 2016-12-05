class Api::V1::Accounts::RegistrationsController < ApplicationController

  respond_to :json

  def create
    @user = User.new(user_params)
      if @user.provider == 'linkedin' && User.find_by_email(@user.email)
        return render json: {error: "User email is already exists. please try login"}, status: 422
      else
        if @user.save
          render json: UserSerializer.new(@user).serializable_hash, status: 201
        else
          render json: {user: @user.errors.as_json}, status: 422
        end
      end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :provider, :designation, :organization_name, :contact_number, :city, :state, :industry_domain, :organization_value, :password, :uid)
  end
end