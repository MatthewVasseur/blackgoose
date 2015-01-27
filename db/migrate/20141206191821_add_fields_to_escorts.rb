class AddFieldsToEscorts < ActiveRecord::Migration
  def change
    add_column :escorts, :username, :string
    add_index :escorts, :username, unique: true

    # background check
      add_column :escorts, :name, :string
      add_column :escorts, :dob, :date
      # address columns
        add_column :escorts, :line1, :string
        add_column :escorts, :city, :string
        add_column :escorts, :state, :string
        add_column :escorts, :zip, :string

    # physical information
    add_column :escorts, :height, :string
    add_column :escorts, :weight, :string
    add_column :escorts, :ethnicity, :string
    add_column :escorts, :tit_size, :string
    add_column :escorts, :tit_type, :string # natural or fake
    add_column :escorts, :eyec, :string
    add_column :escorts, :hairc, :string

    # only login with verified accounts
    add_column :escorts, :verified, :boolean, default: false

    #also add account token
    add_column :escorts, :token, :string, default: "0"

  end
end
