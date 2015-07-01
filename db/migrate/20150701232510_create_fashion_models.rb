class CreateFashionModels < ActiveRecord::Migration
  def change
    create_table :fashion_models do |t|
      t.integer :user_id
      t.string :instagram

      t.timestamps null: false
    end
  end
end
