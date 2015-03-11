Rails.application.routes.draw do
  get 'static_pages/home'

  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/faq'

  get 'orders/new'

  get 'orders/show'

  resources :photos

  devise_for :users
   resources :posts do
      resources :orders, only: [:new, :create]
    end

  resources :posts do
    collection do
      match 'search' => 'posts#search', via: [:get, :post], as: :search
    end
  end

  root 'static_pages#home'
end
