class AddCanchaCToFutboladas < ActiveRecord::Migration
  def change
    add_column :futboladas, :cancha_c, :string
  end
end
