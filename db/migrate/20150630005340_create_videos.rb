class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
    	t.string :title, null: false
    	t.text :description, null: false
    	t.string :source_url, null: false
    	t.integer :shares, null: false, default: 0
    	t.datetime :deleted_at
    	t.references :model, index: true

      t.timestamps null: false
    end
  end
end
