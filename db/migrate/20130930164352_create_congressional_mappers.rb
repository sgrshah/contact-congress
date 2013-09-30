class CreateCongressionalMappers < ActiveRecord::Migration
  def change
    create_table :congressional_mappers do |t|

      t.timestamps
      t.integer :state_id
      t.string :zip_code
      t.string :district
    end
  end
end
