require 'test_helper'

class AlertasControllerTest < ActionDispatch::IntegrationTest
  test "should get asignar_grupo" do
    get alertas_asignar_grupo_url
    assert_response :success
  end

  test "should get gestionar_grupo" do
    get alertas_gestionar_grupo_url
    assert_response :success
  end

  test "should get designar_grupos" do
    get alertas_designar_grupos_url
    assert_response :success
  end

  test "should get terminar_gestion" do
    get alertas_terminar_gestion_url
    assert_response :success
  end

end
