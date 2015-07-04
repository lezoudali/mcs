class SetDefaultToViews < ActiveRecord::Migration
  def change
    change_column :videos, :views, :integer, default: 0
  end
end
