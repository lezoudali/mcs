class CreateMcsAdmins < ActiveRecord::Migration
  def change
    create_table :mcs_admins do |t|
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
