require 'subdomain'

Tataurovv::Application.routes.draw do
  constraints :subdomain => "admin" do
    get '/' => 'admin/root#index'
    scope :module => "admin", :as => "admin" do
      resources :works
    end
  end

  #namespace :admin do
  #  constraints subdomain: 'admin' do
  #    resources :works
  #    get '/' => 'admin/admin#index'
  #  end
  #end

  get '/about' => 'about#index'
  get '/contacts' => 'contacts#index'

  resources :works

  root :to => 'root#index'


  #constraints(Subdomain) do
  #  match '/' => 'admin/admin#index', via: :get
  #  resources :works
  #end


  #constraints(:subdomain => /admin/) do
  #  namespace :admin do
  #    resources :works
  #  end
  #end
  #namespace :admin do
  #  constraints subdomain: 'admin' do
  #    resources :works
  #    root :to => 'admin#index'
  #  end
  #end
end
