class ChangeOwnerIdToInteger < ActiveRecord::Migration
  def up
    change_column :articles, :owner_id, :integer
  end

  def down
    change_column :articles, :owner_id, :string
  end

end
