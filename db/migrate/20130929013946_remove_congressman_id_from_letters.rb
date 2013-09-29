class RemoveCongressmanIdFromLetters < ActiveRecord::Migration
  def change
  	remove_column :congressmen, :congessman_id, :integer
  end
end
