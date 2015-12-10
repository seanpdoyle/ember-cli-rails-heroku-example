Rails.application.routes.draw do
  mount_ember_app :admin, to: "/admin", controller: "admin"
  mount_ember_app :frontend, to: "/"
end
