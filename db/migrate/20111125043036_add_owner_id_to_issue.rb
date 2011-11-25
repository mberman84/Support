class AddOwnerIdToIssue < ActiveRecord::Migration
  def change
    add_column :issues, :owner_id, :integer
  end
end
