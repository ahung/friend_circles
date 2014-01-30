class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pw_reset_token, :string
  end
end
