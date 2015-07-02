class ChangeSharesToViewsInVideo < ActiveRecord::Migration
  def change
    rename_column :videos, :shares, :views
  end
end
