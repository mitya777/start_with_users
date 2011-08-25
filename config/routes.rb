SampleApp::Application.routes.draw do

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
