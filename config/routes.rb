Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    devise_for :customers

    scope module: :public do
      get "customers/my_page" => "customers#show"
      get "customers/edit" => "customers#edit"
      patch "customers" => "customers#update"
      get "customers/unsubscribe" => "customers#unsubscribe"
      patch "customers/withdraw" => "customers#withdraw"
    end

    namespace :admin do
      resources :customer, :except => [:destroy, :new, :create]
    end

    scope module: :public do
      resources :addresses,  :except => :new
    end
  
end
