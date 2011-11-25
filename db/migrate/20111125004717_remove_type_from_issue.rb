class RemoveTypeFromIssue < ActiveRecord::Migration
  def up
    remove_column :issues, :type
  end

  def down
  end
end
