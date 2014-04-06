class ReservaCanchasController < ApplicationController
  # GET /reserva_canchas
  # GET /reserva_canchas.json
  def index
    @reserva_canchas = ReservaCancha.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reserva_canchas }
    end
  end

  # GET /reserva_canchas/1
  # GET /reserva_canchas/1.json
  def show
    @reserva_cancha = ReservaCancha.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reserva_cancha }
    end
  end

  # GET /reserva_canchas/new
  # GET /reserva_canchas/new.json
  def new
    @reserva_cancha = ReservaCancha.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reserva_cancha }
    end
  end

  # GET /reserva_canchas/1/edit
  def edit
    @reserva_cancha = ReservaCancha.find(params[:id])
  end

  # POST /reserva_canchas
  # POST /reserva_canchas.json
  def create
    @reserva_cancha = ReservaCancha.new(params[:reserva_cancha])

    respond_to do |format|
      if @reserva_cancha.save
        format.html { redirect_to @reserva_cancha, notice: 'Reserva cancha was successfully created.' }
        format.json { render json: @reserva_cancha, status: :created, location: @reserva_cancha }
      else
        format.html { render action: "new" }
        format.json { render json: @reserva_cancha.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reserva_canchas/1
  # PUT /reserva_canchas/1.json
  def update
    @reserva_cancha = ReservaCancha.find(params[:id])

    respond_to do |format|
      if @reserva_cancha.update_attributes(params[:reserva_cancha])
        format.html { redirect_to @reserva_cancha, notice: 'Reserva cancha was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reserva_cancha.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reserva_canchas/1
  # DELETE /reserva_canchas/1.json
  def destroy
    @reserva_cancha = ReservaCancha.find(params[:id])
    @reserva_cancha.destroy

    respond_to do |format|
      format.html { redirect_to reserva_canchas_url }
      format.json { head :no_content }
    end
  end
end
