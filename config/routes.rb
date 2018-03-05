Rails.application.routes.draw do
  root 'michikusa#top'
  post '/index', to: 'michikusa#index'
  get '/index', to: 'michikusa#index'
  get '/show', to: 'michikusa#show'
  get '/twitter', to: 'twitter#index'
  post '/twitter', to: 'twitter#tweet'
end
