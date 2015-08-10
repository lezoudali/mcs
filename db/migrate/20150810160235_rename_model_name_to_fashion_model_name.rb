class RenameModelNameToFashionModelName < ActiveRecord::Migration
  def change
    rename_column :videos, :model_name, :fashion_model_name 
  end
end
