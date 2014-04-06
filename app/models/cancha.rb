# encoding: UTF-8
class Cancha < ActiveRecord::Base
  attr_accessible :monto, :nombre

  belongs_to :usuario
  has_many :reserva_canchas
  has_many :reservas, :through => :reserva_canchas

  validates :nombre, :presence => { :message => "El Nombre debe estar presente" }
  validates :monto, :presence => { :message => "El Monto debe estar presente" }

  validates_numericality_of :monto, :greater_than => 0, :less_than => 10000, :message => "El monto debe ser un número entre 0 y 10000"
end
