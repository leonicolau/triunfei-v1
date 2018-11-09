# frozen_string_literal: true

module ApplicationHelper
  def cid_param
    params[:cid] || params[:taboolaclickid]
  end

  def user_wizard_params
    params.permit!.to_h.merge(referer: request.referer, device_name: set_device_name,
                              device_type: set_device_type, os: set_os_name, browser: set_browser)
  end

  def name_for_current_user
    current_user.name ||
      current_user.email.split('@')[0]
  end

  def insert_tracking_code
    return render('shared/user_tracking') unless controller_name != 'wizards' && !Rails.env.production?
  end

  def insert_wpp_button
    return render('shared/wpp_button') if controller_name != 'wizards'
  end

  def inser_ct_code
    return render('shared/cv_tracking') unless controller_name != 'landing_pages' && !Rails.env.production?
  end
end
