class AddShowModalButtonToCountry < ActiveRecord::Migration[5.0]
  def change
    add_column :countries, :show_modal_button, :boolean, default: false
  end
end
