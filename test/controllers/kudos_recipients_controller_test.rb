require 'test_helper'

class KudosRecipientsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get kudos_recipients_create_url
    assert_response :success
  end

end
