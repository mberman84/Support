class RemoveUserIssues < ActiveRecord::Migration
  def up
    drop_table :user_issues
  end

  def down
  end
end
