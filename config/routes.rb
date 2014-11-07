Rails.application.routes.draw do
  resources :finders

  root to: 'finders#index'
end
