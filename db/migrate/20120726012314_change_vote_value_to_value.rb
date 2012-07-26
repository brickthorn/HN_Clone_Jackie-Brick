class ChangeVoteValueToValue < ActiveRecord::Migration
  def up
    rename_column :votes, :vote_value, :value
  end

  def down
    rename_column :votes, :value, :vote_value
  end
end
