Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :heros, only: [:index, :show] do
        member do
          get :abilities
        end
      end
      resources :abilities, only: [:index, :show]
    end
  end
end
