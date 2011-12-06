class RemoveAssociationsTable < ActiveRecord::Migration
  def up
    drop_table :associations
  end

  def down
  end
end
