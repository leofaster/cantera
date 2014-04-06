class CreateFutboladas < ActiveRecord::Migration
  def change
    create_table :futboladas do |t|
      t.integer :usuario_id
      t.date :fecha_ingreso
      t.boolean :cancha_a
      t.boolean :cancha_b
      t.string :hora_inicio
      t.integer :cant_horas
      t.text :descripcion

      t.timestamps
    end
  end
end
