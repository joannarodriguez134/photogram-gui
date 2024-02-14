Rails.application.routes.draw do

  get("/", { :controller => "users", :action => "index"})

  get("/users", { :controller => "users", :action => "index"})
  get("/users/:path_username", { :controller => "users", :action => "show"})
  post("/insert_user", { :controller => "users", :action => "create"})

  get("/photos", { :controller => "photos", :action => "index"})
  get("/photos/:path_photo_id", { :controller => "photos", :action => "show"})
  get("/delete_photo/:path_photo_id", { :controller => "photos", :action => "destroy"})
  post("/insert_photo", { :controller => "photos", :action => "create"})
  post("/update_photo/:photo_id", { :controller => "photos", :action => "update"})


end
