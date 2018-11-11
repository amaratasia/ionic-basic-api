require 'test_helper'

class UserIngredientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_ingredient = user_ingredients(:one)
  end

  test "should get index" do
    get user_ingredients_url
    assert_response :success
  end

  test "should get new" do
    get new_user_ingredient_url
    assert_response :success
  end

  test "should create user_ingredient" do
    assert_difference('UserIngredient.count') do
      post user_ingredients_url, params: { user_ingredient: { ingredient_id: @user_ingredient.ingredient_id, quanity: @user_ingredient.quanity, user_id: @user_ingredient.user_id } }
    end

    assert_redirected_to user_ingredient_url(UserIngredient.last)
  end

  test "should show user_ingredient" do
    get user_ingredient_url(@user_ingredient)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_ingredient_url(@user_ingredient)
    assert_response :success
  end

  test "should update user_ingredient" do
    patch user_ingredient_url(@user_ingredient), params: { user_ingredient: { ingredient_id: @user_ingredient.ingredient_id, quanity: @user_ingredient.quanity, user_id: @user_ingredient.user_id } }
    assert_redirected_to user_ingredient_url(@user_ingredient)
  end

  test "should destroy user_ingredient" do
    assert_difference('UserIngredient.count', -1) do
      delete user_ingredient_url(@user_ingredient)
    end

    assert_redirected_to user_ingredients_url
  end
end
