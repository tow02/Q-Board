class CreateRoomSubjects < ActiveRecord::Migration
  def change
    create_table :room_subjects do |t|
      t.text :name

      t.timestamps null: false
    end
  end
end
