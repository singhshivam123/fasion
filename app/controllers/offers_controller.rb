# frozen_string_literal: true

# :nodoc:
class OffersController < ApplicationController
  before_action :set_offer, only: %i[show edit update destroy]
  before_action :set_paginate, only: :index
  # before_action :set_cart, only: :create
  before_action :authenticate_user!

  def index
    @offers = Offer.page(@page).per(@per_page)
  end

  def show; end

  def edit; end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)

    respond_to do |format|
      if @offer.save
        format.html { redirect_to @offer, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @offer }
      else
        format.html { render :new }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to @offer, notice: 'Offer was successfully updated.' }
        format.json { render :show, status: :ok, location: @offer }
      else
        format.html { render :edit }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @offer.destroy
    respond_to do |format|
      format.html { redirect_to offers_url, notice: 'Offer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_offer
    @offer = Offer.find_by(id: params[:id])

    redirect_to offers_path, notice: 'Offer is not exist' if @offer.blank?
  end

  def offer_params
    params.require(:offer).permit(:title, offer_location_attributes: %i[id location_id])
  end
end
