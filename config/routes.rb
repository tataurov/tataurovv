Tataurovv::Application.routes.draw do
  get '/about' => 'about#index'
  get '/contacts' => 'contacts#index'

  resources :works

  root :to => 'root#index'
end
