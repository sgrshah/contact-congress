class AddStreetToLetter < ActiveRecord::Migration
  def change
  	add_column :letters, :street, :string
  end
end
