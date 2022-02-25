require "test_helper"

class PostTest < ActiveSupport::TestCase
  test "post can only be created with a title" do
    post = Post.create(content: "No title")

    refute post.valid?
    assert_equal "Title can't be blank", post.errors.first.full_message
  end

  test "a post can only be created with a title at least 5 characters long" do
    post = Post.create(title: "A", content: "Short title")

    refute post.valid?
    assert_equal "Title is too short (minimum is 5 characters)", post.errors.first.full_message
  end


end
