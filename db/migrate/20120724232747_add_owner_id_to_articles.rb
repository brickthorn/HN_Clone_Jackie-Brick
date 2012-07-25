class AddOwnerIdToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :owner_id, :string
  end
end
