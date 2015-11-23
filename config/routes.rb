Rails.application.routes.draw do
  mount_ember_app :frontend, to: "/helpers", controller: "helper_tags", action: "index"
  mount_ember_app :frontend, to: "/"
end
