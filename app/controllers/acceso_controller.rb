class AccesoController < ApplicationController

  layout 'admin'

  before_action :confirm_logged_in, :except => [:login, :intento_login, :logout]
  
  def index
  end

  def login
  end

  def intento_login
  	if params[:username].present? && params[:password].present?
      found_user = Empleado.where(:username => params[:username]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end
    if authorized_user
      # mark user as logged in
      session[:user_id] = authorized_user.id
      session[:username] = authorized_user.username
      flash[:notice] = "Login exitoso."
      redirect_to(:action => 'index')
    else
      flash[:notice] = "Error en el username/password."
      redirect_to(:action => 'login')
    end
  end

  def logout
  	session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = "Logged out"
    redirect_to(:action => "login")
  end

end
