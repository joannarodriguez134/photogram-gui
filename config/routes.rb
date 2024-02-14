Rails.application.routes.draw do

  get("/", { :controller => "users", :action => "index"})

  get("/users", { :controller => "users", :action => "index"})
  get("/users/:path_username", { :controller => "users", :action => "show"})


  get("/photos", { :controller => "photos", :action => "index"})
  get("/photos/:path_photo_id", { :controller => "photos", :action => "show"})
  get("/delete_photo/:path_photo_id", { :controller => "photos", :action => "destroy"})
  post("/insert_photo", { :controller => "photos", :action => "create"})


end
