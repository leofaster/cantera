Current::Application.routes.draw do
  resources :reserva_canchas


  resources :canchas
  get "/servicios/canchas/:id" => 'canchas#destroy', :as => "cancha_borrar"

  resources :futboladas, :path => "/servicios/futboladas"
  get "/servicios/horas_inicio_futbolada" => 'futboladas#horasInicio', :as => "horas_inicio_futbolada"
  get "/servicios/horas_cant_futbolada" => 'futboladas#horasInicioCant', :as => "horas_cant_futbolada"
  get "/servicios/futbolada/:id" => 'futboladas#destroy', :as => "futbolada_borrar"

  resources :reservas, :path => "/servicios/reservas"
  get "/servicios/horas_inicio_reserva" => 'reservas#horasInicio', :as => "horas_inicio_reserva"
  get "/servicios/horas_cant_reserva" => 'reservas#horasInicioCant', :as => "horas_cant_reserva"
  get "/servicios/precio" => 'reservas#precio', :as => "precio"
  get "/servicios/reserva/:id" => 'reservas#destroy', :as => "reserva_borrar"

  # Estaticos
  get "/index" => 'estaticos#index', :as => "index"
  get "/ubicanos" => 'estaticos#ubicanos', :as => "ubicanos"
  get "/sobre_nosotros" => 'estaticos#sobre_nosotros', :as => "sobre_nosotros"

  # Servicios
  get "/servicios" => 'servicios#index', :as => "servicios"

  get "/gestion" => 'gestion#index', :as => "gestion"
  get "/gestion/usuarios" => 'gestion#index', :as => "usuarios"
  post "/gestion/usuarios" => 'gestion#create'
  get "/gestion/usuario/new" => 'gestion#new', :as => "new_usuario"
  get "/gestion/usuario/:id/edit" => 'gestion#edit', :as => "edit_usuario"
  get "/gestion/usuario/:id" => 'gestion#show', :as => "usuario"
  put "/gestion/usuario/:id" => 'gestion#update', :as => "gestion_act_usuarios"
  get "/gestion/usuario/borrar/:id" => 'gestion#destroy', :as => "usuario_borrar"

  devise_for :usuarios, :path => '', :path_names => { :sign_in => "iniciar_sesion", :sign_out => "cerrar_sesion", :sign_up => "registrar" }

  get "welcome/index"
  root :to => 'estaticos#index'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
