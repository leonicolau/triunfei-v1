ActiveAdmin.register Bank do
  permit_params :name, :photo, :card_bank_description, :loan_bank_description, :account_bank_description, :card_description, :utm_source, :affiliate_link, :card_postback_url, :account_postback_url, :loan_postback_url, :show_at_wizard, :show_in_filter

  filter :name

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  index do
    column :id
    column :name
    actions
  end

  form do |f|
    f.inputs 'Bank details' do
      f.input :name
      f.input :utm_source
      f.input :card_postback_url
      f.input :account_postback_url
      f.input :loan_postback_url
      f.input :affiliate_link
      f.input :photo
      f.input :card_description
      f.input :card_bank_description
      f.input :loan_bank_description
      f.input :account_bank_description
      f.input :show_at_wizard, as: :boolean
      f.input :show_in_filter, as: :boolean
    end
    f.actions
  end

end
