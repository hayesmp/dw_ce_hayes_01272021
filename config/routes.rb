Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :customers, only: [:show, :create] do
    resources :orders, only: [:index, :create], controller: 'customers/orders'
  end

  resources :products, only: [:index]
end
