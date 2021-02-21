# frozen_string_literal: true

# :nodoc:
class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  # before_action :set_pincode, only: :edit

  def edit
    @pincode = if @pincode.nil?
                 Pincode.find(6)
               else
                 Pincode.find_by(pincode: params[:pincode])
               end
  end

  def show; end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path } if @company.theme == 'theme_a'
        format.html { redirect_to checkouts_path } if @company.theme == 'theme_b'
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
  end

  def user_params
    params.require(
      :user
    ).permit(
      :email, :first_name, :last_name, :gender, :mobile,
      :address, :location, :city, :state, :country, :pincode
    )
  end
end
