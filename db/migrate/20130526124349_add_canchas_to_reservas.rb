class AddCanchasToReservas < ActiveRecord::Migration
  def change
    add_column :reservas, :hora_inicio_b, :integer
    add_column :reservas, :cant_horas_b, :integer
    add_column :reservas, :hora_inicio_c, :integer
    add_column :reservas, :cant_horas_c, :integer
  end
end
