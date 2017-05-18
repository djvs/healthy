Rails.application.routes.draw do
  resources :reviews
  resources :restaurants

  root to: 'application#index'

  get "partial/:partial"     => "partial#partial"
  match ':path'           => 'application#index', :constraints => { :path => /.+/ }, via: [:get,:post]

end
