Rails.application.routes.draw do
  get '/concerts/list' => 'concerts#show_all_by_month' , as: 'list_by_month'
  get '/' => 'concerts#index' , as: 'front_page'
  resources :concerts do
    resources :comments
  end
end
