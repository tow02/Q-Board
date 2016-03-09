class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.text :name
      t.text :description

      t.timestamps null: false
    end
  end
end
