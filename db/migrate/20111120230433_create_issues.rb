class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :subject
      t.text :description
      t.string :type
      t.string :status

      t.timestamps
    end
  end
end
