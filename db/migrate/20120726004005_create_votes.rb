class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :posting_id
      t.string :posting_type

      t.timestamps
    end
  end
end
