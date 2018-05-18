Rails.application.routes.draw do
  resources :releases do
    get 'search_listings', as: :search_listings
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
