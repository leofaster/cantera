# coding: utf-8
class EstaticosController < ApplicationController
  def index
    if !session[:exito].nil?
       @exito = session[:exito]
       @modulo = session[:modulo]
       session[:exito] = nil
    end
  end

  def servicios
  end

  def ubicanos
  end
 
  def sobre_nosotros
  end
end
