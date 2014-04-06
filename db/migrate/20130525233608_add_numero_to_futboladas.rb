class AddNumeroToFutboladas < ActiveRecord::Migration
  def change
    add_column :futboladas, :numero, :string
  end
end
