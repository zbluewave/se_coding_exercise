Rails.application.routes.draw do

  resources :complaints
  root 'complaints#index'

end
