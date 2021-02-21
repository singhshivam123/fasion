# frozen_string_literal: true

# :nodoc:
class HomeController < ApplicationController
  before_action :set_paginate, only: :index

  def index
    @cart = Cart.new
    @categories = Category.where(active: true)
    @products = Product.page(@page).per(@per_page)
    @products = @products.where(category_id: params[:category_id]) if params[:category_id].present?
  end

  def contact
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        flash[:success] = 'Record created successfully.'
        format.html { redirect_to '/contact' }
      else
        format.html { render :contact }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :subject, :message)
  end

  def tester_params
    params.require(:tester).permit(:country, :city, :state)
  end
end
