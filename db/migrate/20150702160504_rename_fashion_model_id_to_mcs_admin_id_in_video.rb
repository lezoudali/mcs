class RenameFashionModelIdToMcsAdminIdInVideo < ActiveRecord::Migration
  def change
    rename_column :videos, :fashion_model_id, :mcs_admin_id
  end
end
