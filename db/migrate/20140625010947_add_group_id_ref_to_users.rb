class AddGroupIdRefToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :groupInt, index: true
    add_reference :users, :individualInt, index: true
  end
end
