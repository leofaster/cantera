# coding: utf-8
class RegistrationsController < Devise::RegistrationsController
  # POST /resource/sign_up
  def create
    build_resource

    if resource.save
      set_flash_message :notice, :signed_up
      #redirect_to :conectors, :flash => {:success => "Se ha registrado con éxito."}
      sign_in_and_redirect(resource_name, resource)
      #this commented line is responsible for sign in and redirection
      #change to something you want..
    else
      clean_up_passwords(resource)
      #redirect_to :back, :flash => {:error => "asd."}
      render :new
    end
  end
end
