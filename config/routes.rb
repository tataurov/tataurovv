require 'subdomain'

Tataurovv::Application.routes.draw do
  devise_for :users

  constraints :subdomain => "admin" do
    get '/' => 'admin/root#index'

    scope :module => "admin", :as => "admin" do
      resources :works
      resources :work_types
      resources :images

      get '/images/crop/:id' => 'images#crop', :as => 'crop_image'
    end
  end


  get '/about' => 'about#index'
  get '/contacts' => 'contacts#index'

  resources :works, only: [:show, :index]
  resources :work_types, only: [:show, :index]
  resources :images, only: [:show, :index]



  root :to => 'root#index', :subdomain => ''

end
