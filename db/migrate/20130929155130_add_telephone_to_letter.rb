class AddTelephoneToLetter < ActiveRecord::Migration
  def change
  	add_column :letters, :telephone, :string
  end
end
