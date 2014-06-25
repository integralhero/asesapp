class RenameUserId2 < ActiveRecord::Migration
  def change
  	rename_column :individual_ints, :user_id, :user_id_id
  end
end
