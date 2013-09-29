class CreateLetterIssues < ActiveRecord::Migration
  def change
    create_table :letter_issues do |t|

      t.timestamps
      t.integer :letter_id
      t.integer :issue_id
    end
  end
end
