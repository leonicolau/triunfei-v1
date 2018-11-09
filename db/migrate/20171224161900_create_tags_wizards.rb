class CreateTagsWizards < ActiveRecord::Migration[5.1]
  def change
    create_table :tags_wizards do |t|
      t.references :tag, foreign_key: true
      t.references :wizard, foreign_key: true
    end
  end
end
