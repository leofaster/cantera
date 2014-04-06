class ChangeHoraInicioToReservas < ActiveRecord::Migration
  def up
    change_column :reservas, :hora_inicio, :integer
  end

  def down
  end
end
