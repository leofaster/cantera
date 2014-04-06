class FutboladasController < ApplicationController
  before_filter :authenticate_usuario!, :only => [:create]

  # GET /futboladas
  # GET /futboladas.json
  def index
    @futboladas = Futbolada.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @futboladas }
    end
  end

  # GET /futboladas/1
  # GET /futboladas/1.json
  def show
    @futbolada = Futbolada.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @futbolada }
    end
  end

  # GET /futboladas/new
  # GET /futboladas/new.json
  def new
    @futbolada = Futbolada.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @futbolada }
    end
  end

  # GET /futboladas/1/edit
  def edit
    @futbolada = Futbolada.find(params[:id])
  end

  # POST /futboladas
  # POST /futboladas.json
  def create
    params[:futbolada][:usuario_id] = current_usuario.id
    @futbolada = Futbolada.new(params[:futbolada])

    respond_to do |format|
      if @futbolada.save
        @futbolada.numero = "#{Time.zone.now.strftime('%Y%m%d%H%M%S')}-#{@futbolada.id}F"
        @futbolada.save
        StatusServicioSolicitado.servicio_email(current_usuario,@futbolada).deliver
        session[:exito] = "si"
        session[:modulo] = "futbolada"
        format.html { redirect_to index_url }
        format.json { render json: @futbolada, status: :created, location: @futbolada }
      else
        format.html { render action: "new" }
        format.json { render json: @futbolada.errors, status: :unprocessable_entity }
      end
    end
  end

  def horasInicio
    @lista = consultarHorasInicioF(params[:fecha_ingreso],params[:cancha_a],params[:cancha_b],params[:cancha_c])

    respond_to do |format|
        format.json { render json: @lista }
    end
  end

  def horasInicioCant
    @lista = consultarCantidadHorasF(params[:fecha_ingreso],params[:hora_ingreso],params[:cancha_a],params[:cancha_b],params[:cancha_c])

    respond_to do |format|
        format.json { render json: @lista }
    end
  end

  # PUT /futboladas/1
  # PUT /futboladas/1.json
  def update
    @futbolada = Futbolada.find(params[:id])

    respond_to do |format|
      if @futbolada.update_attributes(params[:futbolada])
        format.html { redirect_to gestion_url, notice: 'Futbolada was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @futbolada.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /futboladas/1
  # DELETE /futboladas/1.json
  def destroy
    @futbolada = Futbolada.find(params[:id])
    @futbolada.destroy

    respond_to do |format|
      format.html { redirect_to gestion_url }
      format.json { head :no_content }
    end
  end
end
