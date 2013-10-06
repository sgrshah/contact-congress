class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|

      t.timestamps
      t.string :street
      t.string :city
      t.string :state_id
      t.string :zip_code
    end
  end
end
