class AddAtributosToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :nombre, :string
    add_column :usuarios, :apellido, :string
    add_column :usuarios, :cedula, :integer
    add_column :usuarios, :telefono, :string
  end
end
