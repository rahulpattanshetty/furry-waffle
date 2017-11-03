class AddColumnTenants < ActiveRecord::Migration
  def change
  	add_column :tenants, :count, :integer, default:0
  end
end
