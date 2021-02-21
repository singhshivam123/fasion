# frozen_string_literal: true

require 'test_helper'

class PincodesControllerTest < ActionDispatch::IntegrationTest
  test 'should get set_pincode' do
    get pincodes_set_pincode_url
    assert_response :success
  end
end
