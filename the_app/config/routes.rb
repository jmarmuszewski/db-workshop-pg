Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'

  resources :users, only: [:index, :show] do
    resources :sessions, only: [:index]
  end
  resources :bans, only: [:index]
  resources :products, only: [:index] do
    resources :prices, only: [:index]
  end
  resources :oreders, only: [:index]



  namespace :api, defaults: { format: :json } do
    resources :users, only: [:index, :create, :show] do
      resources :sessions, only: [:index, :create, :show, :destroy]
      resources :orders, only: [:index, :create, :show] do
        resources :items, only: [:index, :create]
      end
    end
    resources :bans, only: [:index, :create, :show]
    resources :products, only: [:index, :create, :show] do
      resources :prices, only: [:index, :create, :show]
    end
    resources :orders, only: [:index, :show] do
      resources :items, only: [:index, :create]
    end
    resources :sessions, only: [:show]
    resources :emails, only: [:show]
    resources :emails_a, only: [:index]
    resources :emails_b, only: [:index]
  end
end

# bin/rails generate model User first_name:string last_name:string email:string address1:string address2:string city:string date_of_birth:date
# bin/rails generate model Ban email:string reason:text
# bin/rails generate model Session user:references token:string
# bin/rails generate model Product name:string description:text
# bin/rails generate model Price product:references price:int available:boolean
# bin/rails generate model Order user:references documnet_id:string finalized:boolean
# bin/rails generate model OrderList price:references order:references qunatity:integer discount:integer
