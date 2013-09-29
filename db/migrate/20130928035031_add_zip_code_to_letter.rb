class AddZipCodeToLetter < ActiveRecord::Migration
  def change
		add_column :letters, :zip_code, :string
  end
end
