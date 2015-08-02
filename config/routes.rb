Rails.application.routes.draw do
  get '/concerts/list' => 'concerts#show_all_by_month' , as: 'list_by_month'
  resources :concerts
  get '/' => 'concerts#index' , as: 'front_page'
end
