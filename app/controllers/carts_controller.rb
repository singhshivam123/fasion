# frozen_string_literal: true

# :nodoc:
class CartsController < ApplicationController
  before_action :set_cart, only: %i[edit update destroy]
  before_action :set_paginate, only: :index
  before_action :authenticate_user!

  def index
    @carts = current_user.carts.page(@page).per(@per_page)
  end

  def edit; end

  def create
    @product = Product.friendly.find_by(slug: params[:slug])
    @cart = Cart.new(cart_params)
    if @cart.save
      # format.html {}
      redirect_to carts_path
      flash[:success] = 'Cart was successfully created.'
    else
      # format.html { render template: 'products/show' }
      # format.json { render json: @cart.errors, status: :unprocessable_entity }
      flash[:alert] = @cart.errors
    end
  end

  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to carts_path, notice: 'Cart was successfully updated.' }
        format.json { render :index, status: :ok, location: @cart }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: 'Cart was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private

  def set_cart
    @cart = Cart.find_by(id: params[:id])
  end

  def cart_params
    params.require(
      :cart
    ).permit(
      :user_id, :product_id, :product_color_id, :product_size_id, :quantity, :total
    )
  end
end
