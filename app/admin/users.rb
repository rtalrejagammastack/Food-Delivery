ActiveAdmin.register User do

  permit_params :first_name, :last_name, :email, :password_digest, :confirmed_at, :unconfirmed_email, :role
  
end
