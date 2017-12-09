class ConvertToStripe < ActiveRecord::Migration[4.2]
  def change
    add_column :spree_supplier_bank_accounts, :country_iso, :integer
    add_column :spree_supplier_bank_accounts, :name, :string
  end
end
