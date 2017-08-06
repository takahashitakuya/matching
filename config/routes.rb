Rails.application.routes.draw do
  
  get 'monologs/index'

  get 'monologs/show'

  get 'monologs/edit'

  get 'monologs/new'

  get 'cover_images/index'

  get 'cover_images/show'

  get 'cover_images/profile'

  # get 'messages/user/:id' =>'messages#user'
  
  # get 'messages/new' => 'messages#new'
  
  # post 'messages' => 'messages#create'
  # delete 'messages' => 'messages#destroy'
  
resources :profiles
resources :messages do 
  collection do
    get 'profile/:id' => 'messages#profile'
  end
end

resources :cover_images do 
  collection do
    get 'profile/:id' => 'cover_images#profile'
  end
end
  devise_for :users
  get 'pages/top'
  root 'pages#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 post 'relations/create' => 'relations#create'
 post 'relations/destroy' => 'relations#destroy_ajax'
 delete 'relations/:id' => 'relation#destroy'
 
 resources :monologs
end
