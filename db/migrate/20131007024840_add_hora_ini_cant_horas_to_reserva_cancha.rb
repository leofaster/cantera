class AddHoraIniCantHorasToReservaCancha < ActiveRecord::Migration
  def change
    add_column :reserva_canchas, :hora_ini, :integer
    add_column :reserva_canchas, :cant_horas, :integer
  end
end
