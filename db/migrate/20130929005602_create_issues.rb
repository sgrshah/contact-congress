class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.timestamps
      t.string :title
    end
  end
end
