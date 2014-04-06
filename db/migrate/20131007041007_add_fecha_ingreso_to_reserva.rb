class AddFechaIngresoToReserva < ActiveRecord::Migration
  def change
    add_column :reservas, :fecha_ingreso, :date
  end
end
