class AddAttachmentToLandingPages < ActiveRecord::Migration[5.1]
  def change
    add_attachment :landing_pages, :photo
  end
end
