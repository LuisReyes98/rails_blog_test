Rails.application.routes.draw do
  
  resources :users
  #get 'welcome/index'
  #get 'special',to: 'welcome#index' #esto es un hash que hace que cuando se llama a la ruta special responde 'welcome#index'
  
  resources :articles  #crea todo el CRUD de articles  
=begin 
  	get "/articles", to: "articles#index", as: "articles"	index
  	post "/articles" 			create 
  	delete "/articles/:id" destroy			delete
  	get "/articles/:id" 		show
  	get "/articles/new"			new
  	get "/articles/:id/edit"	edit
  	patch "/articles/:id"		update
  	put "/articles/:id"  		update
=end

  post '/articles/new'

  post 'welcome/index' #solo se podra accerder si un link_to llama por post protege la aplicación a recargas de la pagina por el usuario 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #para hacer que la root principal la primera pagina que se abre sea welcome/index
  root 'welcome#index'
  
  
  #root 'views#index' #aqui esta el controlador de la peticion json de Wialon

  


end
