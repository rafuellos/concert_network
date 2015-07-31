Rails.application.routes.draw do
  resources :concerts
  get '/' => 'concerts#index' , as: 'front_page'
end
