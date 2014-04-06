class ChangeCanchaCToFutbolada < ActiveRecord::Migration
  def up
    change_table :futboladas do |t|
      t.change :cancha_c, :boolean
    end
  end

  def down
  end
end
