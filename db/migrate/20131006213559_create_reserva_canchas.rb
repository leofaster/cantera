class CreateReservaCanchas < ActiveRecord::Migration
  def change
    create_table :reserva_canchas do |t|
      t.integer :reserva_id
      t.integer :cancha_id
      t.float :monto

      t.timestamps
    end
  end
end
