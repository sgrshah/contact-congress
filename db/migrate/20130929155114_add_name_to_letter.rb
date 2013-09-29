class AddNameToLetter < ActiveRecord::Migration
  def change
		add_column :letters, :name, :string
  end
end
