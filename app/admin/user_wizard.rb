ActiveAdmin.register UserWizard do
  menu label: 'Leads'

  permit_params bank_ids: []
  actions :all, except: [:new, :destroy, :edit, :update, :create]

  filter :wizard_id, as: :select, collection: proc { Wizard.all }
  filter :created_at

  member_action :get_lead, method: :put do
    user_wizard = UserWizard.find(params[:id])
    raise 'You are not allowed to do this operation' unless UserWizardPolicy.new(current_admin_user, user_wizard).get_lead?
    user_wizard.update!(admin_user_id: current_admin_user.id)
    redirect_to admin_user_wizard_path(user_wizard)
  end

  controller do
    def scoped_collection
      scope = UserWizardPolicy::Scope.new(current_admin_user, UserWizard).resolve
      if current_admin_user.admin_profile.broker?
        scope = scope.where(admin_user_id: current_admin_user.id)
      end
      scope
    end

    def find_resource
      scoped_collection.where(id: params[:id]).first
    end
  end

  csv(column_names: false) do
    column('fields') do |uw|
      "#{uw.user.email};#{uw.user_wizard_answers.map(&:value).join(';')}"
    end
  end

  index do
    id_column
    column :user
    column :wizard
    actions
  end

  show do |user_wizard|
    attributes_table do
      row :params
      row :user_wizard
      row :wizard
      row :created_at
      row :answers
      row :user_wizard_answers do |user_wizard|
        ul do
          user_wizard.user_wizard_answers.each do |answer|
            li(span "#{answer.wizard_field.name}: #{answer.value}")
          end
        end
      end
    end
  end

end
