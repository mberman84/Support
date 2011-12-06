class AddIsPublisherToUser < ActiveRecord::Migration
  def change
    add_column :users, :is_publisher, :bool
  end
end
