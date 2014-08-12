class AlertasController < ApplicationController
  
   layout "admin"

   before_action :confirm_logged_in

  def index
    @alertas = Alerta.order('fecha_vencimiento ASC')
  end

  def show
    @alerta = Alerta.find(params[:id])
  end

  def new
    @alerta = Alerta.new()
    @empleados = Empleado.all
  end

  def create
    # Instantiate a new object using form parameters
    @alerta = Alerta.new(alerta_params)
    # Save the object
    if @alerta.save
      # If save succeeds, redirect to the index action
      flash[:notice] = "Alerta creada exitosamente"
      redirect_to(:action => 'index')
    else
      # If save fails, redisplay the form so user can fix problems
      @empleados = Empleado.all
      render('new')
    end
  end

  def edit
    @alerta = Alerta.find(params[:id])
    @empleados = Empleado.all
  end

  def update
    # Find an existing  object using form parameters
    @alerta = Alerta.find(params[:id])
    if @alerta.update_attributes(alerta_params)
      # If update succeeds, redirect to the show action
      flash[:notice] = "Alerta actualizada exitosamente"
      redirect_to(:action => 'show', :id => @alerta.id)
    else
      # If update fails, redisplay the form so user can fix problems
      @empleados = Empleado.all
      render('edit')
    end
  end

  def delete
    @alerta = Alerta.find(params[:id])
  end

  def destroy
    alerta = Alerta.find(params[:id])
    alerta.destroy
    flash[:notice] = "Alerta eliminada exitosamente"
    redirect_to(:action => 'index')
  end
  
   private

    def alerta_params
      # same as using "params[:subject]", except that it:
      # - raises an error if :subject is not present
      # - allows listed attributes to be mass-assigned
      params.require(:alerta).permit(:empleado_id, :tipo, :observacion, :fecha_vencimiento)
    end

end
