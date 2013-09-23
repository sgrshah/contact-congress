class CreateLetters < ActiveRecord::Migration
  def change
    create_table :letters do |t|
      t.timestamps
      t.string :author
      t.text :content
    end
  end
end
