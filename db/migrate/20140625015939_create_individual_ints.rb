class CreateIndividualInts < ActiveRecord::Migration
  def change
    create_table :individual_ints do |t|
      t.string :location
      t.references :user_id, index: true
      t.datetime :dt

      t.timestamps
    end
  end
end
