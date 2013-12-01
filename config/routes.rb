Img::Application.routes.draw do
 
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root :to => 'home#index'
  resources :images, :only => [:show, :create, :destroy]

end
