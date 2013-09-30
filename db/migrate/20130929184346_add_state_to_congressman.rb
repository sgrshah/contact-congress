class AddStateToCongressman < ActiveRecord::Migration
  def change
  	add_column :congressmen, :state, :string
  end
end
