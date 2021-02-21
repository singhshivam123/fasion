# frozen_string_literal: true

# :nodoc:
class ApplicationController < ActionController::Base
  before_action :set_profile
  before_action :set_company
  before_action :set_seo
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_no_of_cart
  before_action :set_view_path

  def set_view_path
    prepend_view_path "#{Rails.root}/app/views/#{@company.theme}"
  end

  protected

  def set_paginate
    @page = params[:page].to_i > 1 ? params[:page] : 1
    @per_page = params[:per_page].to_i > 1 ? params[:per_page] : 4
  end

  private

  def set_no_of_cart
    return if current_user.blank?

    @carts = Cart.where(user_id: current_user.id)
    @no_of_cart = @carts.count
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: %i[first_name last_name gender]
    )
    devise_parameter_sanitizer.permit(
      :account_update, keys: %i[
        first_name last_name gender mobile address location city country pincode state
      ]
    )
  end

  def set_profile
    @profile = SocialProfile.where(active: true)
  end

  def set_company
    @company = Company.first
  end

  def set_seo
    @seo = Seo.find_by(url: request.path)
    @seo = Seo.find_by(url: 'default') if @seo.blank?
  end
end
