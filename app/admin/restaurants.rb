ActiveAdmin.register Restaurant do

  # has_many :admin_users
  
  # scope_to :current_admin_user

  # controller do 
  #   def current_admin_user
  #       current_admin_user   
  #   end
  # end

  permit_params :name, :address, :phone
  
end
