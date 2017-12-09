class AddFeaturedToSpreeProducts < ActiveRecord::Migration[4.2]
  def change
    add_column :spree_products, :featured, :boolean, default: false
  end
end
