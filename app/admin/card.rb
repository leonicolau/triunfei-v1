ActiveAdmin.register Card do
  permit_params :bank_id, :name, :card_type, :monthly_recharge, :bank_usp1, :wizard_link, :modal_name, :company_name, :text_of_column_one, :text_of_column_two, :text_of_column_three, :title_modal_box, :bank_usp2, :discount, :points, :design, :international, :anuity_description,
                :insurance, :flag_call_center, :flag_prem1, :flag_prem2, :flag_prem3, :flag_prem4, :anuity_discount, :active, :air_miles, :max_daily_redirect, :description_promo,
                :anuity, :anuity_multiple, :minimum_rent, :interest_rate, :flag_id, :link, :insurance2, :string, :landing_url, :order, :wizard_1, :wizard_2, :wizard_3, :photo, :highlighted, devices: []

  filter :bank_id, as: :select, collection: proc { Bank.all }
  filter :flag_id, as: :select, collection: proc { Flag.all }

  filter :name

  controller do

    def scoped_collection
      Card.with_inactive
    end

    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  index do
    column :photo do |card|
      image_tag(card.photo.url(:thumb), style: 'width: 40px')
    end
    column :name
    column :bank
    column :flag
    column :order
    column :active
    actions
  end

  form do |f|
    f.inputs 'Card details' do
      f.input :name
      f.input :order
      f.input :bank, as: :select, collection: Bank.all
      f.input :card_type
      f.input :flag_id, as: :select, collection: Flag.all
      f.input :devices, as: :select, collection: [['mobile', 'mobile'], ['desktop', 'desktop']], multiple: true
      f.input :anuity
      f.input :anuity_multiple
      f.input :anuity_description
      f.input :minimum_rent
      f.input :points
      f.input :air_miles
      f.input :insurance
      f.input :insurance2
      f.input :bank_usp1
      f.input :bank_usp2
      f.input :discount
      f.input :design
      f.input :flag_call_center
      f.input :flag_prem1
      f.input :flag_prem2
      f.input :flag_prem3
      f.input :flag_prem4
      f.input :anuity_discount
      f.input :interest_rate
      f.input :link
      f.input :wizard_link
      f.input :landing_url
      f.input :modal_name
      f.input :title_modal_box
      f.input :company_name
      f.input :text_of_column_one
      f.input :text_of_column_two
      f.input :text_of_column_three
      f.input :monthly_recharge
      f.input :wizard_1
      f.input :wizard_2
      f.input :wizard_3
      f.input :max_daily_redirect
      f.input :international
      f.input :active
      f.input :highlighted, as: :boolean
      f.input :description_promo
      f.input :photo, as: :file, hint: image_tag(f.object.photo.url(:thumb))
    end
    f.actions
  end

  show do |card|
    attributes_table do
      row :name
      row :order
      row :bank
      row :card_type
      row :anuity
      row :anuity_multiple
      row :anuity_description
      row :minimum_rent
      row :flag
      row :points
      row :insurance
      row :bank_usp1
      row :bank_usp2
      row :discount
      row :design
      row :flag_call_center
      row :flag_prem1
      row :flag_prem2
      row :flag_prem3
      row :flag_prem4
      row :anuity_discount
      row :interest_rate
      row :link
      row :wizard_link
      row :landing_url
      row :modal_name
      row :title_modal_box
      row :company_name
      row :text_of_column_one
      row :text_of_column_two
      row :text_of_column_three
      row :monthly_recharge
      row :wizard_1
      row :wizard_2
      row :wizard_3
      row :international
      row :active
      row :highlighted
      row :photo do
        image_tag(card.photo.url)
      end
      # Will display the image on show object page
    end
  end
end
# rubocop:enable Metrics/BlockLength
