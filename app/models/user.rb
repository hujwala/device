class User < ActiveRecord::Base
  include DeviseTokenAuth::Concerns::User
  before_save -> { skip_confirmation! }

  validates_presence_of :name
  validates_format_of :password, :with => /\A^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d!$%@#£€*?&]{8,}$\z/,
  message: "Password must contain minimum 8 characters with at least one lowercase, one uppercase and one numeric.",
  unless: Proc.new { |user| user.password.blank? }

  def password_required?
    super && !(provider.present? && provider == "linkedin")
  end

  # def token_validation_response
  #   UserSerializer.root = false
  #   UserSerializer.new(self).as_json
  # end
end