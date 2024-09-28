Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })

  get("/directors/youngest", { :controller => "directors", :action => "max_dob" })
  get("/directors/eldest", { :controller => "directors", :action => "min_dob" })

  get("/directors", { :controller => "directors", :action => "index" })
  get("/directors/:path_id", { :controller => "directors", :action => "show" })
  post("/insert_director", { :controller => "directors", :action => "create_director" })
  post("/delete_director/:path_id", { :controller => "directors", :action => "delete_director" })
  post("/update_director/:path_id", { :controller => "directors", :action => "update_director" })

  get("/movies", { :controller => "movies", :action => "index" })
  get("/movies/:path_id", { :controller => "movies", :action => "show" })
  post("/insert_movie", { :controller => "movies", :action => "create_movie" })
  post("/delete_movie/:path_id", { :controller => "movies", :action => "delete_movie" })
  post("/update_movie/:path_id", { :controller => "movies", :action => "update_movie" })
  
  get("/actors", { :controller => "actors", :action => "index" })
  get("/actors/:path_id", { :controller => "actors", :action => "show" })
  post("/insert_actor", { :controller => "actors", :action => "create_actor" })
  post("/delete_actor/:path_id", { :controller => "actors", :action => "delete_actor" })
  post("/update_actor/:path_id", { :controller => "actors", :action => "update_actor" })
end
