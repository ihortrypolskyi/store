require 'test_helper'

class OrderBooksControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get order_books_create_url
    assert_response :success
  end

  test "should get update" do
    get order_books_update_url
    assert_response :success
  end

  test "should get destroy" do
    get order_books_destroy_url
    assert_response :success
  end

end
