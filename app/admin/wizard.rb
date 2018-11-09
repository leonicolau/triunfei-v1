ActiveAdmin.register Wizard do
  permit_params :tag_ids, :name, :show_to_broker, :wizard_type, :wpp_button, :pixel_code, :postback_url, :thank_you_message, :welcome_message, :redirect_to_first_result, :display_thank_you_page, wizard_fields_attributes: [:id, :name, :mask, :label, :search_type,
                :_destroy, :default_value, :field_type, :step , :dropdown_options, :min_value, :max_value, :interval, :add_to_metrics]

  filter :name

  index do
    id_column
    column :name
    column :slug
    actions
  end

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  form do |f|
    f.inputs 'Wizard details' do
      f.input :name
      f.input :wizard_type
      f.input :redirect_to_first_result, as: :boolean
      f.input :display_thank_you_page, as: :boolean
      f.input :thank_you_message
      f.input :welcome_message
      f.input :pixel_code
      f.input :postback_url
      f.input :tags
      f.input :show_to_broker, as: :boolean
      f.input :wpp_button, as: :boolean
    end
    f.inputs "Fields" do
      f.has_many :wizard_fields, heading: false, allow_destroy: true do |field|
        field.input :label
        field.input :name
        field.input :field_type
        field.input :dropdown_options
        field.input :step, as: :select, collection: [[1,1], [2,2], [3,3]]
        field.input :default_value
        field.input :min_value
        field.input :max_value
        field.input :interval
        field.input :mask
        field.input :search_type
        field.input :add_to_metrics, as: :boolean
      end
    end
    f.actions
  end

  show do
    render partial: 'libraries/google_charts', locals: { metric: @metric }
    wizard.wizard_fields.where(add_to_metrics: true).each do |wizard_field|
      panel wizard_field.label do
        pie_chart UserWizardAnswer.where(wizard_field: wizard_field).group(:value).count
      end
    end
  end

end
