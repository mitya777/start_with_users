SampleApp::Application.routes.draw do

  #extension api
  match '/quests/current' => 'quests#current', :via => :get
  match '/quests/current' => 'quests#clear_current', :via => :post
  match '/quests/last' => 'quests#last', :via => :get

  match '/questfeed' => 'quest_feeds#set', :via => :post
  match '/questfeed' => 'quest_feeds#get', :via => :get

  resources :users do
    resource :quest_feed
  end

  resources :users do
    resources :quests 
  end

  resources :quests do
    resources :answers
  end

  get "sessions/new"

  resources :users
  resources :sessions, :only => [:new, :create, :destroy]
  resources :quests
  resources :urls, :only => [:create, :destroy]
  resources :answers
  
  match '/signup', :to => 'users#new'
  match '/signin', :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'

  match '/about', :to  => 'pages#about'
  match '/contact', :to => 'pages#contact'
  match '/help', :to => 'pages#help'
  root :to => 'pages#home'
end
