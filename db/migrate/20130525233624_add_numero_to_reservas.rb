class AddNumeroToReservas < ActiveRecord::Migration
  def change
    add_column :reservas, :numero, :string
  end
end
