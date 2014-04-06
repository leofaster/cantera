require 'test_helper'

class FutboladasControllerTest < ActionController::TestCase
  setup do
    @futbolada = futboladas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:futboladas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create futbolada" do
    assert_difference('Futbolada.count') do
      post :create, futbolada: { cancha_a: @futbolada.cancha_a, cancha_b: @futbolada.cancha_b, cant_horas: @futbolada.cant_horas, descripcion: @futbolada.descripcion, fecha_ingreso: @futbolada.fecha_ingreso, hora_inicio: @futbolada.hora_inicio, usuario_id: @futbolada.usuario_id }
    end

    assert_redirected_to futbolada_path(assigns(:futbolada))
  end

  test "should show futbolada" do
    get :show, id: @futbolada
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @futbolada
    assert_response :success
  end

  test "should update futbolada" do
    put :update, id: @futbolada, futbolada: { cancha_a: @futbolada.cancha_a, cancha_b: @futbolada.cancha_b, cant_horas: @futbolada.cant_horas, descripcion: @futbolada.descripcion, fecha_ingreso: @futbolada.fecha_ingreso, hora_inicio: @futbolada.hora_inicio, usuario_id: @futbolada.usuario_id }
    assert_redirected_to futbolada_path(assigns(:futbolada))
  end

  test "should destroy futbolada" do
    assert_difference('Futbolada.count', -1) do
      delete :destroy, id: @futbolada
    end

    assert_redirected_to futboladas_path
  end
end
