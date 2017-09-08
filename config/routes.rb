Rails.application.routes.draw do
  
  get 'sessions/new'
  get 'dash/welcome'
  get 'policies/select_company'
  get 'policies/select_plan'
  root to: 'dash#welcome'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users,:companies,:plans, :policies
end
