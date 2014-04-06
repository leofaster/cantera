class ReservasController < ApplicationController  
  before_filter :authenticate_usuario!, :only => [:create]

  # GET /reservas
  # GET /reservas.json
  def index
    @reservas = Reserva.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reservas }
    end
  end

  # GET /reservas/1
  # GET /reservas/1.json
  def show
    @reserva = Reserva.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reserva }
    end
  end

  # GET /reservas/new
  # GET /reservas/new.json
  def new
    @reserva = Reserva.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reserva }
    end
  end

  # GET /reservas/1/edit
  def edit
    @reserva = Reserva.find(params[:id])
  end

  # POST /reservas
  # POST /reservas.json
  def create
    params[:reserva][:usuario_id] = current_usuario.id
    params[:reserva][:status] = "pendiente"
    @reserva = Reserva.new(params[:reserva])

    params[:reserva_cancha].each do |key,rc|
Rails.logger.warn "anteeeeeees #{rc[:cancha_id]}"
	@cancha = Cancha.find(rc[:cancha_id])
	rc[:monto] = @cancha.monto

      @reserva.reserva_canchas << ReservaCancha.new(rc)
    end

    respond_to do |format|
        if @reserva.save
            session[:exito] = "si"
            session[:modulo] = "reserva"
	    StatusServicioSolicitado.servicio_email(current_usuario,@reserva).deliver
            format.html { redirect_to index_url }
            format.json { render json: @reserva, status: :created, location: @reserva }
        else
            format.html { render action: "new" }
            format.json { render json: @reserva.errors, status: :unprocessable_entity }
        end
    end
  end

  def horasInicio
    @lista = consultarHorasInicio(params[:fecha_ingreso])

    respond_to do |format|
        format.json { render json: @lista }
    end
  end

  def horasInicioCant
    @lista = consultarCantidadHoras(params[:fecha_ingreso],params[:hora_ingreso],params[:tipo_cancha])

    respond_to do |format|
        format.json { render json: @lista }
    end
  end

  # PUT /reservas/1
  # PUT /reservas/1.json
  def update
    @reserva = Reserva.find(params[:id])

    respond_to do |format|
      if @reserva.update_attributes(params[:reserva])
        format.html { redirect_to gestion_url, notice: 'Reserva was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reserva.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservas/1
  # DELETE /reservas/1.json
  def destroy
    @reserva = Reserva.find(params[:id])
    @reserva.destroy

    respond_to do |format|
      format.html { redirect_to gestion_url }
      format.json { head :no_content }
    end
  end

  def precio
    cancha = params[:nombre]
    precio = Cancha.where("nombre='#{cancha}'")[0].monto
    
    respond_to do |format|
        format.json { render json: precio }
    end
  end
end
