Rails.application.routes.draw do

  devise_for :users
  root to: "home#index"

  get 'download', to: 'home#download', as: 'download_files'
end
