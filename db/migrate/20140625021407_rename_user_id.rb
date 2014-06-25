class RenameUserId < ActiveRecord::Migration
  def change
  	rename_column :group_ints, :user_id_id, :user_id
  end
end
