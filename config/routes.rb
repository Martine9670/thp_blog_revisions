Rails.application.routes.draw do
resources :articles do
    resources :comments
  end
  get "welcome/index"
  get "up" => "rails/health#show", as: :rails_health_check
  root "welcome#index"
end
