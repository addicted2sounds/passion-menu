Rails.application.routes.draw do
  root 'home#index'

  namespace :api, defaults: { format: :json } do
    resources :verticals, except: %i[new edit] do
      scope shallow: true do
        resources :categories, except: %i[new edit] do
          resources :courses, except: %i[new edit]
        end
      end
    end
  end
  get '/auth/github/callback', to: 'auth/omniauth_callbacks#create'
  get '*path', to: 'home#index', constraints: ->(request) do
    !request.xhr? && request.format.html?
  end
end
