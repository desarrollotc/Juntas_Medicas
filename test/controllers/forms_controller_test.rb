require 'test_helper'

class FormsControllerTest < ActionDispatch::IntegrationTest
  test "should get diligenciador" do
    get forms_diligenciador_url
    assert_response :success
  end

  test "should get visualizador" do
    get forms_visualizador_url
    assert_response :success
  end

end
