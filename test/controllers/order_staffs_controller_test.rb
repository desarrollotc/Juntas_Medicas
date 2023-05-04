require 'test_helper'

class OrderStaffsControllerTest < ActionDispatch::IntegrationTest
  test "should get staff" do
    get order_staffs_staff_url
    assert_response :success
  end

  test "should get cirugia_mohs" do
    get order_staffs_cirugia_mohs_url
    assert_response :success
  end

  test "should get dermatologia" do
    get order_staffs_dermatologia_url
    assert_response :success
  end

  test "should get linfomas_cutaneos" do
    get order_staffs_linfomas_cutaneos_url
    assert_response :success
  end

  test "should get funcional_clinico" do
    get order_staffs_funcional_clinico_url
    assert_response :success
  end

  test "should get funcional_quirurgico" do
    get order_staffs_funcional_quirurgico_url
    assert_response :success
  end

  test "should get torax" do
    get order_staffs_torax_url
    assert_response :success
  end

  test "should get gastrointestinal" do
    get order_staffs_gastrointestinal_url
    assert_response :success
  end

  test "should get mastologia" do
    get order_staffs_mastologia_url
    assert_response :success
  end

  test "should get terapias_especiales" do
    get order_staffs_terapias_especiales_url
    assert_response :success
  end

  test "should get oncologiacirugia_cabeza_cuello" do
    get order_staffs_oncologiacirugia_cabeza_cuello_url
    assert_response :success
  end

  test "should get tumores_pelvicos" do
    get order_staffs_tumores_pelvicos_url
    assert_response :success
  end

  test "should get peritoneo" do
    get order_staffs_peritoneo_url
    assert_response :success
  end

  test "should get hematologia" do
    get order_staffs_hematologia_url
    assert_response :success
  end

  test "should get enrutador" do
    get order_staffs_enrutador_url
    assert_response :success
  end

end
