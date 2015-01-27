class AddVerifiedToClient < ActiveRecord::Migration
  def change
    add_column :clients, :verified, :boolean, default: false

    #also add account token
    add_column :clients, :token, :string, default: "0"
  end
end
