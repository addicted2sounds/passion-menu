Rails.application.routes.draw do
  root 'home#index'

  namespace :api, defaults: { format: :json } do
    resources :verticals
  end

  get '*path', to: 'home#index', constraints: ->(request) do
    !request.xhr? && request.format.html?
  end
end
