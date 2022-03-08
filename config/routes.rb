Rails.application.routes.draw do



  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

  # Routes for the Internal task resource:

  # CREATE
  post("/insert_internal_task", { :controller => "internal_tasks", :action => "create" })
          
  # READ
  get("/internal_tasks", { :controller => "internal_tasks", :action => "index" })
  
  get("/internal_tasks/:path_id", { :controller => "internal_tasks", :action => "show" })
  
  # UPDATE
  
  post("/modify_internal_task/:path_id", { :controller => "internal_tasks", :action => "update" })
  
  # DELETE
  get("/delete_internal_task/:path_id", { :controller => "internal_tasks", :action => "destroy" })

  #------------------------------

  # Routes for the Engagement resource:

  # CREATE
  post("/insert_engagement", { :controller => "engagements", :action => "create" })
          
  # READ
  get("/engagements", { :controller => "engagements", :action => "index" })
  
  get("/engagements/:path_id", { :controller => "engagements", :action => "show" })
  
  # UPDATE
  
  post("/modify_engagement/:path_id", { :controller => "engagements", :action => "update" })
  
  # DELETE
  get("/delete_engagement/:path_id", { :controller => "engagements", :action => "destroy" })

  #------------------------------

  # Routes for the Client resource:

  # CREATE
  post("/insert_client", { :controller => "clients", :action => "create" })
          
  # READ
  get("/clients", { :controller => "clients", :action => "index" })
  
  get("/clients/:path_id", { :controller => "clients", :action => "show" })
  
  # UPDATE
  
  post("/modify_client/:path_id", { :controller => "clients", :action => "update" })
  
  # DELETE
  get("/delete_client/:path_id", { :controller => "clients", :action => "destroy" })

  #------------------------------

end
