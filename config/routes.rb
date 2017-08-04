Rails.application.routes.draw do
  resources :quoras
  resources :seller_orders
  resources :user_orders
  resources :user_profiles
  resources :seller_profiles
  resources :books
  resources :carts
  devise_for :sellers
  get '/new_1/:id'=>'quoras#new_1'
  # get 'home/index'
  get '/shop'=>'home#shop'
  get '/seller'=>'home#seller'
  get '/cart'=>'home#cart'
  get 'home/cart'=>'home#cart'
  post '/create'=>'home#create'
  get '/all'=>'home#all'
   root to: "home#index"
  devise_for :users
  get '/checkout'=>'home#checkout'
  get '/payment'=>'home#payment'
  post '/confirm'=>'home#confirm'

  resources :courses do
    resources :course_makers
    post "showcontent" => 'course_makers#showcontent'
  end
  devise_for :teachers
  get '/shop'=>'home#shop'


  get "home/courses"  => "home#courses"

  get "home/ajax" => "home#ajax"
  post "courses/statusChange" => "courses#statusChange"
  get "/showCourse" => "home#showCourse"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
