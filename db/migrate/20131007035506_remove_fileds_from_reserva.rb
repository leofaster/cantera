class RemoveFiledsFromReserva < ActiveRecord::Migration
  def up
    remove_column :reservas, :tipo_cancha
    remove_column :reservas, :fecha_ingreso
    remove_column :reservas, :hora_inicio
    remove_column :reservas, :cant_horas
    remove_column :reservas, :monto
    remove_column :reservas, :numero
    remove_column :reservas, :hora_inicio_b
    remove_column :reservas, :cant_horas_b
    remove_column :reservas, :hora_inicio_c
    remove_column :reservas, :cant_horas_c
  end

  def down
    add_column :reservas, :cant_horas_c, :integer
    add_column :reservas, :hora_inicio_c, :integer
    add_column :reservas, :cant_horas_b, :integer
    add_column :reservas, :hora_inicio_b, :integer
    add_column :reservas, :numero, :string
    add_column :reservas, :monto, :float
    add_column :reservas, :cant_horas, :integer
    add_column :reservas, :hora_inicio, :integer
    add_column :reservas, :fecha_ingreso, :date
    add_column :reservas, :tipo_cancha, :string
  end
end
