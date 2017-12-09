class AddBioToSpreeSuppliers < ActiveRecord::Migration[4.2]
  def change
		add_column :spree_suppliers, :bio, :text
	end
end
