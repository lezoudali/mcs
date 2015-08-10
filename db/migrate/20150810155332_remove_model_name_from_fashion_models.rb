class RemoveModelNameFromFashionModels < ActiveRecord::Migration
  def self.up
    remove_column :fashion_models, :model_name
  end

  def self.down
    add_column :fashion_models, :model_name, :string
  end
end
