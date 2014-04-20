# coding: utf-8
class EstaticosController < ApplicationController
  def index
    if !session[:exito].nil?
       @exito = session[:exito]
       @modulo = session[:modulo]
       session[:exito] = nil
    end

    @publicidad = true;
  end

  def servicios
  end

  def ubicanos
  end
 
  def sobre_nosotros
  end

  def instalaciones
  end

  def contactanos
  end

  def enviar_correo
  end
end
