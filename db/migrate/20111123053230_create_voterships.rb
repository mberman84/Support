class CreateVoterships < ActiveRecord::Migration
  def change
    create_table :voterships do |t|
      t.integer :issue_id
      t.integer :user_id
      t.string :direction

      t.timestamps
    end
  end
end
