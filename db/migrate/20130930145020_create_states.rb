class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|

      t.timestamps
      t.integer :fips_code
      t.string :abbreviation
      t.string :name

    end
  end
end
