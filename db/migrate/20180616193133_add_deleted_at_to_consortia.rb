class AddDeletedAtToConsortia < ActiveRecord::Migration[5.2]
  def change
    add_column :consortia, :deleted_at, :datetime
    remove_column :consortia, :deleted_at_id
  end
end
