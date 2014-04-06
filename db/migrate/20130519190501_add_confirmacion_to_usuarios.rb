class AddConfirmacionToUsuarios < ActiveRecord::Migration
  def up
    add_column :usuarios, :confirmation_token, :string
    add_column :usuarios, :confirmed_at, :datetime
    add_column :usuarios, :confirmation_sent_at, :datetime
    add_index :usuarios, :confirmation_token, :unique => true
    Usuario.update_all(:confirmed_at => Time.now)
  end

  def down
    remove_column :usuarios, :confirmation_token, :confirmed_at, :confirmation_sent_at
  end
end
