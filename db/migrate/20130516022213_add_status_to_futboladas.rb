class AddStatusToFutboladas < ActiveRecord::Migration
  def change
    add_column :futboladas, :status, :string
  end
end
