Rails.application.routes.draw do

namespace :public do
  resources :items
end

namespace :admin do
   resources :items
end
 end
