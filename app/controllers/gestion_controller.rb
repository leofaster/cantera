# coding: utf-8
class GestionController < ApplicationController
  before_filter :authenticate_usuario!

  def index
    if !session[:exito].nil?
      @exito = session[:exito]
      session[:exito] = nil
    end

    if es_cli?
      where = "usuario_id = #{current_usuario.id}"
    end

    @usuarios = Usuario.where("#{where}").order(:nombre,:apellido).page(params[:page_usuarios]).per(6)
    @futboladas = Futbolada.where("#{where}").order("fecha_ingreso DESC, hora_inicio DESC").page(params[:page_futboladas]).per(6)
    @reservas = Reserva.where("#{where}").page(params[:page_reservas]).per(6)
    @canchas = Cancha.where("#{where}").order("nombre").page(params[:page_canchas]).per(6)
    @tab = params[:tab]
  end

  def show
    @usuario = Usuario.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @usuario }
    end
  end

  def new
    @usuario = Usuario.new
  end

  def create
    params[:usuario][:confirmed_at] = Time.now
    @usuario = Usuario.new(params[:usuario])

    respond_to do |format|
      if @usuario.save
        session[:exito] = "La cuenta ha sido creada y a su vez fue activada"
        format.html { redirect_to gestion_url, notice: 'El Cliente fue creado con éxito' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @usuario = Usuario.find(params[:id])
  end

  def update
    @usuario = Usuario.find(params[:id])

    respond_to do |format|
      if @usuario.update_attributes(params[:usuario])
        format.html { redirect_to gestion_url, notice: 'El Cliente fue actualizado con éxito' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @usuario = Usuario.find(params[:id])
    @usuario.destroy

    respond_to do |format|
      format.html { redirect_to gestion_url }
      format.json { head :no_content }
    end
  end

end
