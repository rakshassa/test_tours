Tours::Application.routes.draw do
 
  resources :tours

   root 'tours#index'
end
