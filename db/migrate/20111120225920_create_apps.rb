class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name
      t.text :description
      t.string :version
      t.string :platform

      t.timestamps
    end
  end
end
