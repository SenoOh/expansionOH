class CreatePeopleitems < ActiveRecord::Migration[7.0]
  def change
    create_table :peopleitems do |t|
      t.string :people_id
      t.string :name
      t.string :label
      t.integer :plate

      t.timestamps
    end
  end
end
