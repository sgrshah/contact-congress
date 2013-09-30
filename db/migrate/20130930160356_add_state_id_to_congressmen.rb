class AddStateIdToCongressmen < ActiveRecord::Migration
  def change
  	add_column :congressmen, :state_id, :integer
  end
end
