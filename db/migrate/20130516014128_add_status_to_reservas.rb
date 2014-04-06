class AddStatusToReservas < ActiveRecord::Migration
  def change
    add_column :reservas, :status, :string
  end
end
