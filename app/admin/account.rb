ActiveAdmin.register Account do
  permit_params :bank_id, :name, :minimum_rent, :minimum_deposit, :benefits, :link, :wizard_link, :taxes, :service_packages, :order, :withdrawal, :transfer, :active, :statement, :wizard_1, :wizard_2, :wizard_3, :max_daily_redirect, :highlighted

  filter :bank_id, as: :select, collection: proc { Bank.all }


  controller do
    def scoped_collection
     Account.with_inactive
    end

    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end


  index do
    column :name
    column :active
    actions
  end

  form do |f|
    f.inputs 'Account details' do
      f.input :bank, as: :select, collection: Bank.all
      f.input :name
      f.input :minimum_rent
      f.input :minimum_deposit
      f.input :withdrawal
      f.input :transfer
      f.input :statement
      f.input :link
      f.input :wizard_link
      f.input :order
      f.input :taxes
      f.input :service_packages
      f.input :active
      f.input :benefits
      f.input :wizard_1
      f.input :wizard_2
      f.input :wizard_3
      f.input :max_daily_redirect
      f.input :highlighted, as: :boolean
      f.actions
    end
  end

end
