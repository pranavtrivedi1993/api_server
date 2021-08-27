Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post "authenticate", to: "authentication#authenticate"
      post "sign_up", to: "registrations#sign_up"
      post "profile", to: "users#update"
      get "user_details", to: "users#show"
    end
  end
end
