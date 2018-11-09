ActiveAdmin.register Loan do
  permit_params :bank_id, :name, :description, :link, :wizard_link, :loan_type, :min_amount, :max_amount, :min_payment, :max_payment, :interest_rate, :active, :start_rate, :order, :interest_rate_description, :wizard_1, :wizard_2, :wizard_3, :max_daily_redirect, :highlighted

  filter :bank_id, as: :select, collection: proc { Bank.all }

  controller do

   def scoped_collection
    Loan.with_inactive
   end

    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
end

  index do
    column :name
    column :bank
    column :loan_type
    column :interest_rate
    column :start_rate
    column :order
    column :active
    actions
  end

  form do |f|
    f.inputs 'Loan details' do
      f.input :bank, as: :select, collection: Bank.all
      f.input :name
      f.input :order
      f.input :description
      f.input :link
      f.input :wizard_link
      f.input :loan_type
      f.input :min_amount
      f.input :max_amount
      f.input :min_payment
      f.input :max_payment
      f.input :interest_rate
      f.input :active
      f.input :start_rate
      f.input :interest_rate_description
      f.input :wizard_1
      f.input :wizard_2
      f.input :wizard_3
      f.input :max_daily_redirect
      f.input :highlighted, as: :boolean
      f.actions
    end
  end
end
