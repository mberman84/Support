class RemovePublishersTable < ActiveRecord::Migration
  def up
    drop_table :publishers
  end

  def down
  end
end
