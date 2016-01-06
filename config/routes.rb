Rails.application.routes.draw do

  resources :complaints
  root 'complaints#index'

  scope '/api/v1' do
  	scope '/incident' do
  		get '/search' => 'api_incidents#search'
  		get '/complaints_types' => 'api_incidents#get_complaints_types'
  		get '/statuses' => 'api_incidents#get_statuses'
  	end
  end
end
