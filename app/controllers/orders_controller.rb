# frozen_string_literal: true

# :nodoc:
class OrdersController < ApplicationController
  before_action :set_order, only: %i[confirm show edit update destroy]
  before_action :set_paginate, only: :index
  before_action :set_cart, only: :create
  before_action :authenticate_user!

  def index
    @orders = current_user.orders.page(@page).per(@per_page)
  end

  def show; end

  def confirm
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'orders'
      end
    end
  end

  def checkouts
    @order = Order.new
    @carts = current_user.carts
  end

  def edit; end

  def new
    @order = Order.new
    @carts = current_user.carts
  end

  def create
    respond_to do |format|
      if @order.save
        @carts.each do |cart|
          @order.order_products.create(
            product_id: cart.product_id, quantity: cart.quantity, mrp: cart.product.mrp,
            product_color_id: cart.product_color_id, product_size_id: cart.product_size_id,
            price: (cart.product.mrp * cart.quantity)
          )
        end
        @carts.delete_all
        format.html { redirect_to confirm_path(@order) }
      else
        format.html { render :checkouts } if @company.theme == 'theme_a'
        format.html { render :new } if @company.theme == 'theme_b'
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_cart
    @carts = current_user.carts
    @order = Order.new(order_params)
    @company = Company.first
  end

  def set_order
    @order = current_user.orders.find(params[:id])
    @order_product = @order.order_products
  end

  def order_params
    params.require(:order).permit(
      :user_id, :payment_id, :payment_mode, :date,
      :subtotal, :discount, :discount_type, :total, :status
    )
  end
end
