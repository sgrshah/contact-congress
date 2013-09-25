class CreateLetters < ActiveRecord::Migration
  def change
    create_table :letters do |t|
      t.timestamps
      t.string :author
      t.text :content
      t.integer :congressman_id
    end
  end
end
