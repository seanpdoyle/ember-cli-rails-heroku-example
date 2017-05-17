Rails.application.routes.draw do
  # Useful for just subbing in a vanilla Rails controller for testing.
  # root to: 'pages#index'

  mount_ember_app :admin, to: "/admin", controller: "admin"
  mount_ember_app :frontend, to: "/"
  # mount_ember_assets :frontend, to: "/ember-assets/"
end

