class CreateCongressmanLetters < ActiveRecord::Migration
  def change
    create_table :congressman_letters do |t|

      t.timestamps
      t.integer :congressman_id
      t.integer :letter_id
    end
  end
end
