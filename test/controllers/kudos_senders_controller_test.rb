require 'test_helper'

class KudosSendersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get kudos_senders_index_url
    assert_response :success
  end

end
