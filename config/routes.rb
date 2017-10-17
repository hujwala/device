Rails.application.routes.draw do
  root 'welcomes#index'
  namespace :api do
    scope :v1 do
      scope :accounts do
        mount_devise_token_auth_for 'User', at: 'auth', controllers: {
          :registrations => 'api/v1/accounts/registrations',
          :sessions => 'api/v1/accounts/sessions',
          :passwords => 'api/v1/accounts/passwords',
          :omniauth_callbacks => 'api/v1/accounts/omniauth'
        }
      end
    end
  end
end
