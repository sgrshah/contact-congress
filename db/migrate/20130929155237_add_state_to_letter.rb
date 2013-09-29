class AddStateToLetter < ActiveRecord::Migration
  def change
  	add_column :letters, :AddStateToLetter, :string
  end
end
