class AddPixelCodeToWizard < ActiveRecord::Migration[5.0]
  def change
    add_column :wizards, :pixel_code, :string
  end
end
