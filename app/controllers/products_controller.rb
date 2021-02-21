# frozen_string_literal: true

# :nodoc:
class ProductsController < ApplicationController
  before_action :set_product, only: :show
  before_action :set_paginate, only: :index
  before_action :set_products, only: :index
  before_action :authenticate_user!, only: :show

  def index
    @cart = Cart.new
    @categories = Category.all
    @brands = Brand.all
  end

  def show
    @cart = Cart.new
    @pincode = Pincode.find_by(pincode: params[:pincode])
  end

  private

  def set_product
    @product = Product.friendly.find_by(slug: params[:slug])
  end

  def set_products
    @products = Product.page(@page).per(@per_page)
    @products = @products.where(category_id: params[:category_id]) if params[:category_id].present?
    @products = @products.where(brand_id: params[:brand_id]) if params[:brand_id].present?
    @products = @products.where('name LIKE ?', "%#{params[:name]}%") if params[:name].present?
    @products = params[:order] == 'desc' ? @products.order(price: :desc) : @products.order(:price)
    # return unless (params[:minamount] && params[:maxamount]).present?
    #
    # @products = @products.having_price_between(params[:minamount], params[:maxamount])
  end
end
