Rails.application.routes.draw do

  #users
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:path_username", { :controller => "users", :action => "show" })

#photos
  get("/photos", { :controller => "photos", :action => "index"})
  get("/photos/:path_photo", { :controller => "photos", :action => "show"})

end
