class AddEmailToLetter < ActiveRecord::Migration
  def change
  	add_column :letters, :email, :string
  end
end
