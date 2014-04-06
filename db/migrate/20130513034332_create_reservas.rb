class CreateReservas < ActiveRecord::Migration
  def change
    create_table :reservas do |t|
      t.integer :usuario_id
      t.string :tipo_cancha
      t.date :fecha_ingreso
      t.string :hora_inicio
      t.integer :cant_horas

      t.timestamps
    end
  end
end
