Rails.application.routes.draw do
  resources :spots
  root 'michikusa#top'
  post '/index', to: 'michikusa#index'
  get '/index', to: 'michikusa#index'
  get '/show', to: 'michikusa#show'
end
