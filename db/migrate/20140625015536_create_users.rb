class CreateUsers < ActiveRecord::Migration
  def change
    drop_table :users
    drop_table :group_ints
    drop_table :individual_ints

    create_table :users do |t|
      t.string :name
      t.string :confirmation_code
      t.string :status
      t.references :groupInt, index: true
      t.references :individualInt, index: true

      t.timestamps
    end
  end
end
