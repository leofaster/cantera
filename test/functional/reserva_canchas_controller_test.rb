require 'test_helper'

class ReservaCanchasControllerTest < ActionController::TestCase
  setup do
    @reserva_cancha = reserva_canchas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reserva_canchas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reserva_cancha" do
    assert_difference('ReservaCancha.count') do
      post :create, reserva_cancha: { cancha_id: @reserva_cancha.cancha_id, monto: @reserva_cancha.monto, reserva_id: @reserva_cancha.reserva_id }
    end

    assert_redirected_to reserva_cancha_path(assigns(:reserva_cancha))
  end

  test "should show reserva_cancha" do
    get :show, id: @reserva_cancha
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reserva_cancha
    assert_response :success
  end

  test "should update reserva_cancha" do
    put :update, id: @reserva_cancha, reserva_cancha: { cancha_id: @reserva_cancha.cancha_id, monto: @reserva_cancha.monto, reserva_id: @reserva_cancha.reserva_id }
    assert_redirected_to reserva_cancha_path(assigns(:reserva_cancha))
  end

  test "should destroy reserva_cancha" do
    assert_difference('ReservaCancha.count', -1) do
      delete :destroy, id: @reserva_cancha
    end

    assert_redirected_to reserva_canchas_path
  end
end
