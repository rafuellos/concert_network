Rails.application.routes.draw do
  get '/concerts/list' => 'concerts#show_all_by_month' , as: 'list_by_month'
  get '/' => 'concerts#index' , as: 'front_page'
  get '/search' => 'concerts#search_form', as: 'search_price' 
  post '/search' => 'concerts#search_by_price', as: 'search_price_under' 
  resources :concerts do
    resources :comments
  end
end
