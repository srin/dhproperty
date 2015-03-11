require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    @post = posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post :create, post: { access_info: @post.access_info, bedrooms: @post.bedrooms, city: @post.city, country: @post.country, description: @post.description, holiday: @post.holiday, latitute: @post.latitute, longitude: @post.longitude, longterm: @post.longterm, postcode: @post.postcode, price: @post.price, price_info: @post.price_info, proptype: @post.proptype, roll_shower: @post.roll_shower, sf_bathroom: @post.sf_bathroom, sf_bedroom: @post.sf_bedroom, sf_entry: @post.sf_entry, shortterm: @post.shortterm, state: @post.state, title: @post.title, user_id: @post.user_id }
    end

    assert_redirected_to post_path(assigns(:post))
  end

  test "should show post" do
    get :show, id: @post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post
    assert_response :success
  end

  test "should update post" do
    patch :update, id: @post, post: { access_info: @post.access_info, bedrooms: @post.bedrooms, city: @post.city, country: @post.country, description: @post.description, holiday: @post.holiday, latitute: @post.latitute, longitude: @post.longitude, longterm: @post.longterm, postcode: @post.postcode, price: @post.price, price_info: @post.price_info, proptype: @post.proptype, roll_shower: @post.roll_shower, sf_bathroom: @post.sf_bathroom, sf_bedroom: @post.sf_bedroom, sf_entry: @post.sf_entry, shortterm: @post.shortterm, state: @post.state, title: @post.title, user_id: @post.user_id }
    assert_redirected_to post_path(assigns(:post))
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, id: @post
    end

    assert_redirected_to posts_path
  end
end
