Rails.application.routes.draw do
  root 'products#index'
  resources :products, only: [:index, :create] do
    get :link, on: :member
  end

  get 'vote/:id' => 'products#vote', as: :vote_product

  get 'auth/:provider/callback', to: 'auth_callbacks#create'
  get 'auth/failure', to: 'auth_callbacks#failure'
  delete 'sign_out', to: 'sessions#destroy', as: :sign_out
end
