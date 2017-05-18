require 'test_helper'

class RestaurantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @restaurant = restaurants(:one)
  end

  test "should get index" do
    get restaurants_url
    assert_response :success
  end

  test "should get new" do
    get new_restaurant_url
    assert_response :success
  end

  test "should create restaurant" do
    assert_difference('Restaurant.count') do
      post restaurants_url, params: { restaurant: { addr_1: @restaurant.addr_1, addr_2: @restaurant.addr_2, addr_city: @restaurant.addr_city, addr_code: @restaurant.addr_code, addr_country: @restaurant.addr_country, addr_state: @restaurant.addr_state, desc: @restaurant.desc, name: @restaurant.name, phone_1: @restaurant.phone_1 } }
    end

    assert_redirected_to restaurant_url(Restaurant.last)
  end

  test "should show restaurant" do
    get restaurant_url(@restaurant)
    assert_response :success
  end

  test "should get edit" do
    get edit_restaurant_url(@restaurant)
    assert_response :success
  end

  test "should update restaurant" do
    patch restaurant_url(@restaurant), params: { restaurant: { addr_1: @restaurant.addr_1, addr_2: @restaurant.addr_2, addr_city: @restaurant.addr_city, addr_code: @restaurant.addr_code, addr_country: @restaurant.addr_country, addr_state: @restaurant.addr_state, desc: @restaurant.desc, name: @restaurant.name, phone_1: @restaurant.phone_1 } }
    assert_redirected_to restaurant_url(@restaurant)
  end

  test "should destroy restaurant" do
    assert_difference('Restaurant.count', -1) do
      delete restaurant_url(@restaurant)
    end

    assert_redirected_to restaurants_url
  end
end
