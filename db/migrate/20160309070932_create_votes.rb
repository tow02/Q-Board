class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :answer, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :vote_type

      t.timestamps null: false
    end
  end
end
