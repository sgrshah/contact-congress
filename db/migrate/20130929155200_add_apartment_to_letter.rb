class AddApartmentToLetter < ActiveRecord::Migration
  def change
  	add_column :letters, :apartment, :string
  end
end
