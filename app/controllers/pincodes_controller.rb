# frozen_string_literal: true

# :nodoc:
class PincodesController < ApplicationController
  def test
    @tester = Tester.new
    # @country = Country.find_by(id: params[:country]) if params[:country].present?
    # @state = State.find_by(id: params[:state]) if params[:state].present?
    # @city = City.find_by(id: params[:city]) if params[:city].present?
  end

  def test_create
    @tester = Tester.new(tester_params)

    respond_to do |format|
      if @tester.save
        flash[:success] = 'Record created successfully.'
        format.html { redirect_to '/test' }
      else
        format.html { render :test }
        format.json { render json: @tester.errors, status: :unprocessable_entity }
      end
    end
  end

  def set_pincode
    @pincode = Pincode.find_by(pincode: params[:pincode])
    respond_to do |format|
      format.json
    end
  end

  def set_country
    @countries = if params[:term]
                   Country.where('name LIKE ?', "#{params[:term]&.downcase}%")
                 else
                   Country.all
                 end
    respond_to do |format|
      format.json
    end
  end

  def set_state
    @states = State.where(country_id: params[:country_id])
    respond_to do |format|
      format.json
    end
  end

  def set_city
    @cities = City.where(state_id: params[:state_id])
    respond_to do |format|
      format.json
    end
  end

  private

  def tester_params
    params.require(:tester).permit(:country, :city, :state)
  end
end
