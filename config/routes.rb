Rails.application.routes.draw do
  get 'static_pages/home'

  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/faq'

  resources :photos

  devise_for :users
  resources :posts

  root 'posts#index'
end
