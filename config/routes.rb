require 'subdomain'

Tataurovv::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users

  constraints :subdomain => "admin" do
    get '/' => 'admin/root#index'

    scope :module => "admin", :as => "admin" do
      resources :works
      resources :work_types
      resources :text_variables
      resources :cms_pages
      resources :images

      get '/images/crop/:id' => 'images#crop', :as => 'crop_image'
      get '/works/images/:id' => 'works#work_images', :as => 'work_images'
    end
  end


  get '/about' => 'about#index'
  get '/contacts' => 'contacts#index'

  resources :works, only: [:show, :index]
  resources :work_types, only: [:show, :index]
  resources :text_variables, only: [:show, :index]
  resources :cms_pages, only: [:show, :index]
  resources :images, only: [:show, :index]

  root :to => 'root#index', :subdomain => ''

end
