require 'test_helper'

class DecksControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    @deck = decks(:one)
  end

  test "should get index" do
    get :index, params: { user_id: @user }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { user_id: @user }
    assert_response :success
  end

  test "should create deck" do
    assert_difference('Deck.count') do
      post :create, params: { user_id: @user, deck: @deck.attributes }
    end

    assert_redirected_to user_deck_path(@user, Deck.last)
  end

  test "should show deck" do
    get :show, params: { user_id: @user, id: @deck }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { user_id: @user, id: @deck }
    assert_response :success
  end

  test "should update deck" do
    put :update, params: { user_id: @user, id: @deck, deck: @deck.attributes }
    assert_redirected_to user_deck_path(@user, Deck.last)
  end

  test "should destroy deck" do
    assert_difference('Deck.count', -1) do
      delete :destroy, params: { user_id: @user, id: @deck }
    end

    assert_redirected_to user_decks_path(@user)
  end
end
