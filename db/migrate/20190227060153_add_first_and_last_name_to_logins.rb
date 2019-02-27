class AddFirstAndLastNameToLogins < ActiveRecord::Migration[5.2]
  def change
    add_column :logins, :first_name, :string
    add_column :logins, :last_name, :string
  end
end
