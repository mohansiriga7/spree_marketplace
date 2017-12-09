class AddProfilePictureToSpreeSuppliers < ActiveRecord::Migration[4.2]
  def change
		add_attachment :spree_suppliers, :profile_picture
	end
end
