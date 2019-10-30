Rails.application.routes.draw do
  root 'home#index'

  namespace :api, defaults: { format: :json } do
    resources :verticals, except: %i[new edit] do
      resources :categories, shallow: true, except: %i[new edit]
    end
  end

  get '*path', to: 'home#index', constraints: ->(request) do
    !request.xhr? && request.format.html?
  end
end
