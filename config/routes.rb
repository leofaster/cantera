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
  get "/que_ofrecemos" => 'estaticos#que_ofrecemos', :as => "que_ofrecemos"
  get "/instalaciones" => 'estaticos#instalaciones', :as => "instalaciones"
  get "/contactanos" => 'estaticos#contactanos', :as => "contactanos"
  post "/contactanos" => 'estaticos#enviar_correo'

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
end
