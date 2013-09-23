class CreateCongressmen < ActiveRecord::Migration
  def change
    create_table :congressmen do |t|
      t.timestamps
      t.string :first_name
      t.string :last_name

    end
  end
end
