class CreateGroupInts < ActiveRecord::Migration
  def change
    create_table :group_ints do |t|
      t.string :location
      t.references :user_id, index: true
      t.datetime :dt

      t.timestamps
    end
  end
end
