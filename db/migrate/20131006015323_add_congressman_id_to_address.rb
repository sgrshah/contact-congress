class AddCongressmanIdToAddress < ActiveRecord::Migration
  def change
  	add_column :addresses, :congressman_id, :integer
  end
end
