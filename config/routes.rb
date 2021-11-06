Rails.application.routes.draw do
  resources :tweets #, only: [:show] # except: [:edit, :update]
  resources :fotos, as: :photos, controller: :photos, path_names: { new: 'nuevo', edit: 'editar'}#, param: :photo_id
  # resources :fotos, as: :photos, controller: :photos, path_names: { new: 'nuevo', edit: 'editar'} do
  #   get "preview", on: :member
  #   /fotos/:id/preview
  #   get "preview", on: :collection
  #   /fotos/preview

  #   member do
  #     get "preview" /fotos/:id/preview
  #   end

  #   collection do
  #     get "administrador" /fotos/administrador
  #   end
  # end

  # resources :photos
  # resources :fotos, contoller: :photo
  # photos_path
  # new_photo_path
  # edit_photo_path(:id)
  # photo_path(:id)

  get "/hola", to: "main#hello"
  root to: "main#hello"

  get "bienvenida", to: "main#hi", as: :saludo
  post "hi", to: "main#greetings"

end
