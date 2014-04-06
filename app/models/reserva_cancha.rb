class ReservaCancha < ActiveRecord::Base
  attr_accessible :cancha_id, :monto, :reserva_id, :hora_ini, :cant_horas

  belongs_to :reserva
  belongs_to :cancha
end
