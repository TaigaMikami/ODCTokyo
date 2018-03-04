Rails.application.routes.draw do
  root 'michikusa#top'
  get 'michikusa/index'
  get 'michikusa/show'

end
