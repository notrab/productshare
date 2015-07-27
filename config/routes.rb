Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'auth_callbacks#create'
  get 'auth/failure', to: 'auth_callbacks#failure'
  delete 'sign_out', to: 'sessions#destroy', as: :sign_out
end
