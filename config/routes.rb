Rails.application.routes.draw do
  namespace :public do
    get 'addresses/index'
  end

  namespace :public do
    get 'addresses/edit'
  end

  namespace :public do
    get 'customers/show'
  end

  namespace :public do
    get 'customers/edit'
  end

  namespace :public do
    get 'customers/unsubscribe'
  end

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
