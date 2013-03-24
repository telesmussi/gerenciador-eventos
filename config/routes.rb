Eventos::Application.routes.draw do

  match '/credentials/:id/renew', to: 'credentials#renew', via: :post
  
  match '/cidades/cidades_select/:estado', to: 'cidades#cidades_select', via: :get
  
  match '/companies/select', to: 'companies#select', via: :get
  
  match '/companies/', to: 'companies#delete_all', via: :delete
  
  match '/events/select', to: 'events#select'
  match '/events/:id/select', to: 'events#selected'
  
  match '/participants/find', to: 'participants#find_by_cpf', via: :post

  match 'participants/findbyname', to: 'participants#search_name', via: :post
  
  match '/participants/new_for_company', to: 'participants#new_for_company', via: :post

  match '/credentials/:id/print', to: 'credentials#print'
  
  match '/credentials/find', to: 'credentials#find_by_bar_code', via: :post
  
  
  resources :users

  resources :companies

  resources :events do
    resources :rooms
  end
  
  resources :uploads, :only => [:create, :show]

  resources :rooms do
     resources :entrances, :only => [:new, :create, :index]
  end

  resources :participants do
     resources :credentials
  end

  resources :photos do
    post 'upload', :on => :collection
  end
    
  resources :participants do
    resources :photos
  end
  
  resources :photos do
    post 'upload', :on => :collection
  end
  
  resources :credentials do
     resources :payments
  end

  resources :payments
  
  root :to => 'sessions#new'
  
  resources :sessions, only: [:new, :create, :destroy]
  
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  
end
