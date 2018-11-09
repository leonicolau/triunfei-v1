class AddDeletedAtToModels < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :deleted_at, :datetime
    add_index :accounts, :deleted_at
    
    add_column :admin_users, :deleted_at, :datetime
    add_index :admin_users, :deleted_at
    
    add_column :banks, :deleted_at, :datetime
    add_index :banks, :deleted_at
    
    add_column :blog_posts, :deleted_at, :datetime
    add_index :blog_posts, :deleted_at
    
    add_column :cards, :deleted_at, :datetime
    add_index :cards, :deleted_at
    
    add_column :flags, :deleted_at, :datetime
    add_index :flags, :deleted_at
    
    add_column :landing_pages, :deleted_at, :datetime
    add_index :landing_pages, :deleted_at
    
    add_column :loans, :deleted_at, :datetime
    add_index :loans, :deleted_at
    
    add_column :users, :deleted_at, :datetime
    add_index :users, :deleted_at
  end
end
