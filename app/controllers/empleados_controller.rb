class EmpleadosController < ApplicationController

  layout "admin"

  before_action :confirm_logged_in

  def index
    @empleados = Empleado.all
  end

  def show
    @empleado = Empleado.find(params[:id])
  end

  def new
    @empleado = Empleado.new()
  end
  
  def create
    # Instantiate a new object using form parameters
    @empleado = Empleado.new(empleado_params)
    # Save the object
    if @empleado.save
      # If save succeeds, redirect to the index action
      flash[:notice] = "Empleado creado exitosamente"
      redirect_to(:action => 'index')
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def edit
    @empleado = Empleado.find(params[:id])
  end

  def update
    # Find an existing  object using form parameters
    @empleado = Empleado.find(params[:id])
    if @empleado.update_attributes(empleado_params)
      # If update succeeds, redirect to the show action
      flash[:notice] = "Empleado actualizado exitosamente"
      redirect_to(:action => 'show', :id => @empleado.id)
    else
      # If update fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def delete
    @empleado = Empleado.find(params[:id])
  end

  def destroy
    empleado = Empleado.find(params[:id])
    empleado.alertas.destroy()
    empleado.destroy
    flash[:notice] = "Empleado '#{empleado.nombres}'' eliminado exitosamente"
    redirect_to(:action => 'index')
  end

  private

    def empleado_params
      # same as using "params[:subject]", except that it:
      # - raises an error if :subject is not present
      # - allows listed attributes to be mass-assigned
      params.require(:empleado).permit(:nombres, :apellidos, :rut, :email, :password)
    end


end
