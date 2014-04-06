class AddMontoToReserva < ActiveRecord::Migration
  def change
    add_column :reservas, :monto, :float
  end
end
