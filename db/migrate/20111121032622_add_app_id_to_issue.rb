class AddAppIdToIssue < ActiveRecord::Migration
  def change
    add_column :issues, :app_id, :integer
  end
end
