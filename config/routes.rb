Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do 
      devise_for :users, controllers: {
        sessions: 'api/v1/users/sessions',
        registrations: 'api/v1/users/registrations',
      }
      get 'has-valid-token', to: 'auth#has_valid_token'
    end
  end
end
