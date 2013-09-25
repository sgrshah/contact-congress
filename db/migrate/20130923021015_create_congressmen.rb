class CreateCongressmen < ActiveRecord::Migration
  def change
    create_table :congressmen do |t|
      t.timestamps
      t.string :name
      t.string :district
      t.string :chamber

    end
  end
end
